import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class WorkerAddScreen extends StatelessWidget {
  const WorkerAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var colorPrimary = color.primary;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 36,
        ),
        child: Column(
          children: [
            Text(
              'CREAR TRABAJADOR',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Nombre',
              hint: 'Ingrese un nombre',
            ),
            SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Apellidos',
              hint: 'Ingrese apellidos',
            ),
            SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Dni',
              hint: 'Ingrese dni',
            ),
            SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Correo',
              hint: 'Ingrese correo',
            ),
            SizedBox(height: 16),
            ButtonStyle1Widget(
              text: 'Crear',
              onPressed: () {
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
