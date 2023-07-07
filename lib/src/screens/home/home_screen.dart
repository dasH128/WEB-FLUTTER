import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(
            top: 32,
            left: 32,
            right: 32,
          ),
          // height: double.infinity,
          child: Column(
            children: [
              const Text(
                'MÓDULOS DEL SISTEMA',
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
                  _MenuOption(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'PROGRAMACIÓN',
                    press: () {
                      context.go('/dashboard/programaciones');
                    },
                  ),
                  _MenuOption(
                    svgSrc: "assets/icons/menu_task.svg",
                    option: 'PLANIFICACIÓN',
                    press: () {
                      context.go('/dashboard/planificaciones');
                    },
                  ),
                  _MenuOption(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'ISLAS',
                    press: () {
                      context.go('/dashboard/islas');
                    },
                  ),
                  _MenuOption(
                    svgSrc: "assets/icons/menu_doc.svg",
                    option: 'PERSONAL',
                    press: () {
                      context.go('/dashboard/trabajadores');
                    },
                  ),
                  // _MenuOption(
                  //   svgSrc: "assets/icons/menu_doc.svg",
                  //   option: 'TURNOS',
                  //   press: () {
                  //     context.go('/dashboard/usuarios');
                  //   },
                  // ),
                  _MenuOption(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'GESTIÓN',
                    press: () {
                      context.go('/dashboard/gestiones');
                    },
                  ),
                  _MenuOption(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'ASISTENCIA',
                    press: () {
                      context.go('/dashboard/asistencia');
                    },
                  ),
                  _MenuOption(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'DASHBOARD',
                    press: () {
                      context.go('/dashboard/grafica');
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

class _MenuOption extends StatelessWidget {
  final String option;
  final String? svgSrc;
  final void Function() press;

  const _MenuOption({
    required this.option,
    required this.press,
    this.svgSrc = 'assets/icons/menu_task.svg',
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.onPrimaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgSrc!,
              colorFilter: ColorFilter.mode(color.onSecondary, BlendMode.srcIn),
              height: 46,
            ),
            const SizedBox(height: 16),
            Text(
              option,
              style: TextStyle(
                color: color.background,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
