import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/provider/provider.dart';
import 'package:sistema_web/src/repositories/bd_repository.dart';

class IslandsScreen extends ConsumerWidget {
  const IslandsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = Theme.of(context).colorScheme;

    var island = ref.watch(islandProvider);
    var islandFilters = [IslandEntity(nombre: 'TODOS'), ...island];
    var filter = ref.watch(islandFilter);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Islas'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(16),
            //   ),
            //   child: Row(
            //     children: [
            //       const Expanded(
            //         child: TextFormFieldStyle1Widget(
            //           prefixIcon: Icon(Icons.search_rounded),
            //           label: 'Buscar',
            //         ),
            //       ),
            //       IconButton(
            //         onPressed: () => context.go('/dashboard/islas-crear'),
            //         icon: const Icon(
            //           Icons.add,
            //           size: 30,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    String? selectedRadio = filter;
                    return AlertDialog(
                      title: const Text('Buscar por Isla'),
                      content: StatefulBuilder(
                        builder: (context, setState) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ...Iterable<int>.generate(islandFilters.length)
                                  .map(
                                    (i) => CheckboxListTile(
                                      title: Text(islandFilters[i].nombre),
                                      value: (selectedRadio ==
                                          islandFilters[i].nombre),
                                      onChanged: (v) {
                                        setState(() {
                                          selectedRadio =
                                              islandFilters[i].nombre;
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
                              ref.read(islandFilter.notifier).state =
                                  selectedRadio!;
                              context.pop();
                            },
                            child: const Text('OK')),
                      ],
                    );
                  },
                );
              },
              child: Container(
                width: 250,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: color.primaryContainer,
                ),
                child: Text('ISLA: ${filter}'),
              ),
            ),
            Expanded(
              child: Container(
                child: _TableDataWorkers(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TableDataWorkers extends ConsumerWidget {
  // final List<WorkerEntity> workers;
  const _TableDataWorkers({
    super.key,
    // required this.workers,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var filter = ref.watch(islandFilter);

    return FutureBuilder<List<WorkerEntity>>(
        future: getWorkersByIsla(filter),
        builder: (context, snapshot) {
          if (snapshot.hasData != true) {
            return const Center(child: CircularProgressIndicator());
          }

          List<WorkerEntity> result = snapshot.data!;
          print(result);
          return DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            fixedColumnsColor: Colors.blue,
            columns: const [
              DataColumn2(
                label: Text('Nombre'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Apellidos'),
              ),
              DataColumn2(
                label: Text('Isla'),
              ),
              DataColumn(
                label: Text('DNI'),
              ),
              DataColumn(
                label: Text('Correo'),
              ),
              // DataColumn2(
              //   fixedWidth: 100,
              //   label: Text('Opciones'),
              // ),
            ],
            rows: [
              ...result.map(
                (w) => DataRow(cells: [
                  DataCell(Text(w.nombre)),
                  DataCell(Text(w.apellido)),
                  DataCell(Text(w.isla ?? '---')),
                  DataCell(Text(w.dni)),
                  DataCell(Text(w.correo)),
                  // DataCell(Row(
                  //   children: [
                  //     IconButton(
                  //       onPressed: () {
                  //         context.push('/dashboard/trabajadores-crear');
                  //       },
                  //       icon: const Icon(Icons.info),
                  //     )
                  //   ],
                  // )),
                ]),
              ),
            ],
          );
        });
  }

  Future<List<WorkerEntity>> getWorkersByIsla(String filter) async {
    return await BDRepository().getWorkersByIsla(filter);
  }
}
