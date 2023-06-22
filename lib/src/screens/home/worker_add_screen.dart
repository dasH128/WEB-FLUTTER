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
            const Text(
              'CREAR TRABAJADOR',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
            const SizedBox(height: 16),
            const TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Nombre',
              hint: 'Ingrese un nombre',
            ),
            const SizedBox(height: 16),
            const TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Apellidos',
              hint: 'Ingrese apellidos',
            ),
            const SizedBox(height: 16),
            const TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Dni',
              hint: 'Ingrese dni',
            ),
            const SizedBox(height: 16),
            const TextFormFieldStyle1Widget(
              prefixIcon: Icon(Icons.person),
              label: 'Correo',
              hint: 'Ingrese correo',
            ),
            const SizedBox(height: 16),
            ButtonStyle1Widget(
              text: 'Crear',
              onPressed: () async{
                await crearWorker();
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }

  Future crearWorker() async {}
  Future listarWorker() async {}
}
