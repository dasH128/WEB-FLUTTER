import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/provider/gestion_provider.dart';
import 'package:sistema_web/src/repositories/bd_repository.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class WorkerAddScreen extends ConsumerWidget {
  const WorkerAddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final color = Theme.of(context).colorScheme;
    // var colorPrimary = color.primary;
    var island = ref.watch(islandProvider);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );
    String nombre = '';
    String apellido = '';
    String dni = '';
    String correo = '';
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
            TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.person),
              label: 'Nombre',
              hint: 'Ingrese un nombre',
              onChanged: (p0) {
                nombre = p0;
              },
            ),
            const SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.person),
              label: 'Apellidos',
              hint: 'Ingrese apellidos',
              onChanged: (p0) {
                apellido = p0;
              },
            ),
            const SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.person),
              label: 'Dni',
              hint: 'Ingrese dni',
              onChanged: (p0) {
                dni = p0;
              },
            ),
            const SizedBox(height: 16),
            TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.person),
              label: 'Correo',
              hint: 'Ingrese correo',
              onChanged: (p0) {
                correo = p0;
              },
            ),
            const SizedBox(height: 16),
            TextOptionStyle1Widget(
              prefixIcon: const Icon(Icons.person),
              label: 'Eliga isla',
              listOption: ['asd', 'asdasd', 'asdasdasd'],
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Eliga una isla'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...island
                                .map((e) => CheckboxListTile(
                                    title: Text(e.nombre),
                                    value: false,
                                    onChanged: (v) {}))
                                .toList()
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text('Cancel')),
                          FilledButton(
                              onPressed: () {
                                // guardar();
                                context.pop();
                              },
                              child: const Text('OK')),
                        ],
                      );
                    });
              },
            ),
            const SizedBox(height: 16),
            ButtonStyle1Widget(
              text: 'Crear',
              onPressed: () async {
                Map<String, String> data = {
                  'nombre': nombre,
                  'apellido': apellido,
                  'dni': dni,
                  'correo': correo,
                };
                await crearWorker(data);
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }

  Future crearWorker(Map<String, String> data) async {
    await BDRepository().createWorker(data);
  }

  Future listarWorkers() async {
    await BDRepository().getWorkers();
  }
}
