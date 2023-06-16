import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

class _ContainerForm extends StatelessWidget {
  const _ContainerForm();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color.onPrimary,
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
          ButtonStyle1Widget(
            text: 'Login',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
