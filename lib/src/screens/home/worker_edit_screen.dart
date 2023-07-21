import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/provider/provider.dart';
import 'package:sistema_web/src/repositories/bd_repository.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class WorkerEditScreen extends ConsumerWidget {
  final WorkerEntity worker;
  const WorkerEditScreen({
    super.key,
    required this.worker,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final color = Theme.of(context).colorScheme;
    // var colorPrimary = color.primary;
    var island = ref.watch(islandProvider);
    // var islaOfWorker = ref.watch(islaOfWorkerProvider);
    // print('islaOF $islaOfWorker');
    var islaOfWorker = ref.watch(islaOfWorkerProvider);
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );
    String nombre = '';
    String apellido = '';
    String dni = '';
    String correo = '';
    // String isla = '';
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
              'EDITAR TRABAJADOR',
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
              label: 'Isla: $islaOfWorker',
              // listOption: ['asd', 'asdasd', 'asdasdasd'],
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      String? selectedRadio = '';
                      if (islaOfWorker != '') {
                        selectedRadio = islaOfWorker;
                      }
                      // var nombre = islaOfWorker;
                      return AlertDialog(
                        title: const Text('Eliga una isla '),
                        content: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ...Iterable<int>.generate(island.length)
                                    .map(
                                      (i) => CheckboxListTile(
                                        title: Text(island[i].nombre),
                                        value:
                                            (selectedRadio == island[i].nombre),
                                        onChanged: (v) {
                                          setState(() {
                                            selectedRadio = island[i].nombre;
                                          });
                                        },
                                      ),
                                    )
                                    .toList(),
                              ],
                            );
                          },
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text('Cancel')),
                          FilledButton(
                              onPressed: () {
                                // selectedRadio = null;
                                ref.read(islaOfWorkerProvider.notifier).state =
                                    selectedRadio!;
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
              text: 'GUARDAR',
              onPressed: () async {
                Map<String, String> data = {
                  'nombre': nombre,
                  'apellido': apellido,
                  'dni': dni,
                  'correo': correo,
                  'isla': islaOfWorker,
                };
                await editarWorker(data);
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }

  Future editarWorker(Map<String, String> data) async {
    // await BDRepository().createWorker(data);
  }

  Future listarWorkers() async {
    await BDRepository().getWorkers();
  }
}
