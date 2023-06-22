import 'dart:js_interop';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/provider/login_provider.dart';
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
          const TextFormFieldStyle1Widget(
            prefixIcon: Icon(Icons.person_rounded),
            label: 'Usuario',
          ),
          const SizedBox(height: 30),
          const TextFormFieldStyle1Widget(
            prefixIcon: Icon(Icons.lock_rounded),
            label: 'Password',
            obscureText: true,
          ),
          const SizedBox(height: 30),
          (isLoading)
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ButtonStyle1Widget(
                  text: 'Login',
                  onPressed: () async {
                    ref
                        .read(isLoadingProvider.notifier)
                        .update((state) => true);
                    await Future.delayed(const Duration(seconds: 1));
                    bool isValid =
                        await login('jeferson322@gmail.com', '1234567890');
                    if (isValid) {
                      ref
                          .read(isLoadingProvider.notifier)
                          .update((state) => false);
                      context.go('/dashboard');
                    } else {
                      ref
                          .read(isLoadingProvider.notifier)
                          .update((state) => false);
                    }
                  },
                )
        ],
      ),
    );
  }

  Future<bool> login(correo, password) async {
    // await Future.delayed(const Duration(seconds: 1));
    // try {
    //   final dio = Dio();
    //   final response = await dio.post('http://localhost:3000/api/auth/login',
    //       data: {"email": correo, "password": password});

    //   print(response.data);
    //   return true;
    // } catch (e) {
    //   if (e is DioException) {
    //     print(e.message);
    //   } else {
    //     print(e);
    //   }
    //   return false;
    // }
    return true;
  }
}
