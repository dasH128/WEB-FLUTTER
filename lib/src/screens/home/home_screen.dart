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
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'PROGRAMACIÓN ATENTO',
                    press: () {
                      context.go('/dashboard/programaciones');
                    },
                  ),
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_task.svg",
                    option: 'PLANIFICACIÓN FCOM',
                    press: () {
                      context.go('/dashboard/planificaciones');
                    },
                  ),
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'ISLAS',
                    press: () {
                      context.go('/dashboard/islas');
                    },
                  ),
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_doc.svg",
                    option: 'PERSONAL',
                    press: () {
                      context.go('/dashboard/trabajadores');
                    },
                  ),
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'GESTIÓN',
                    press: () {
                      context.go('/dashboard/gestiones');
                    },
                  ),
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'ASISTENCIA',
                    press: () {
                      context.go('/dashboard/asistencia');
                    },
                  ),
                  MenuOptionWidget(
                    svgSrc: "assets/icons/menu_dashboard.svg",
                    option: 'PROG vs PLAN',
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
