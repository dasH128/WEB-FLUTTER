import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/provider/login_provider.dart';
import 'package:sistema_web/src/repositories/bd_repository.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Row(
        children: [
          SvgPicture.asset('assets/svgs/login.svg'),
          const Expanded(child: _ContainerForm()),
        ],
      ),
    );
  }
}

class _ContainerForm extends ConsumerWidget {
  const _ContainerForm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isLoading = ref.watch(isLoadingProvider);
    final color = Theme.of(context).colorScheme;
    String passw = '';
    String email = '';
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color.onSecondary,
      ),
      child: Column(
        children: [
          Text(
            'Iniciar Sesión',
            style: TextStyle(
              fontSize: 28,
              color: color.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 40),
          TextFormFieldStyle1Widget(
            prefixIcon: const Icon(Icons.person_rounded),
            label: 'Correo',
            onChanged: (p0) {
              email = p0;
            },
          ),
          const SizedBox(height: 30),
          TextFormFieldStyle1Widget(
            prefixIcon: const Icon(Icons.lock_rounded),
            label: 'Password',
            obscureText: true,
            onChanged: (p0) {
              passw = p0;
            },
          ),
          const SizedBox(height: 30),
          (isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ButtonStyle1Widget(
                  text: 'Login',
                  onPressed: () async {
                    if (email.isEmpty || passw.isEmpty) {
                      ShowAlertCustomer(context, 'Complete los campos');
                      return;
                    }

                    ref
                        .read(isLoadingProvider.notifier)
                        .update((state) => true);
                    await Future.delayed(const Duration(seconds: 1));
                    LoginResponse res = await login(email, passw);
                    if (res.auth) {
                      ref
                          .read(isLoadingProvider.notifier)
                          .update((state) => false);
                      if (res.rol == 'admin') {
                        context.go('/dashboard');
                      } else {
                        context.go('/menu-user');
                      }
                    } else {
                      ref
                          .read(isLoadingProvider.notifier)
                          .update((state) => false);

                      ShowAlertCustomer(context, res.message!);
                    }
                  },
                )
        ],
      ),
    );
  }

  ShowAlertCustomer(context, String msm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ocurrio un error'),
          content: Text(msm),
          actions: [
            FilledButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text('OK')),
          ],
        );
      },
    );
  }

  Future<LoginResponse> login(correo, password) async {
    LoginResponse res = await BDRepository().login(correo, password);
    return res;
  }
}
