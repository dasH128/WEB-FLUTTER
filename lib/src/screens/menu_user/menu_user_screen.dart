import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class MenuUserScreen extends StatelessWidget {
  const MenuUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              const Text(
                'MÓDULOS DE USUARIO',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 36,
                  crossAxisSpacing: 36,
                  crossAxisCount: 4,
                  mainAxisExtent: 200,
                ),
                children: [
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'PROGRAMACIÓN ',
                    press: () {
                      // context.go('/dashboard/programaciones');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
