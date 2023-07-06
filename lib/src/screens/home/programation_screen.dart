import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/repositories/bd_repository.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class ProgramationsScreen extends StatelessWidget {
  const ProgramationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programación'),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: TextFormFieldStyle1Widget(
                      prefixIcon: Icon(Icons.search_rounded),
                      label: 'Buscar',
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () =>
                  //       context.go('/dashboard/programacion-crear',),
                  //   icon: const Icon(
                  //     Icons.add,
                  //     size: 30,
                  //   ),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: _TableDataPlanning(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableDataPlanning extends StatelessWidget {
  const _TableDataPlanning();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPlannings(),
      builder: (context, snapshot) {
        if (snapshot.hasData != true) {
          return const Center(child: CircularProgressIndicator());
        }
        List<PlanningEntity> result = snapshot.data!;

        return DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            fixedColumnsColor: Colors.blue,
            columns: [
              DataColumn2(
                label: Text('Asunto'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('Fecha'),
              ),
              DataColumn2(
                fixedWidth: 100,
                label: Text('Opciones'),
              ),
            ],
            rows: [
              ...result.map((w) => DataRow(cells: [
                    DataCell(Text(w.asunto)),
                    DataCell(Text(w.fecha)),
                    DataCell(Row(
                      children: [
                        (w.estado == true)
                            ? IconButton(
                                onPressed: () {
                                  context.push('/dashboard/programacion-crear',
                                      extra: w);
                                },
                                icon: const Icon(Icons.assignment),
                              )
                            : IconButton(
                                onPressed: () {
                                  context.push(
                                      '/dashboard/programacion-grafica',
                                      extra: w);
                                },
                                icon: const Icon(Icons.dashboard),
                              ),
                      ],
                    )),
                  ])),
            ]);
      },
    );
  }

  Future<List<PlanningEntity>> getPlannings() async {
    return await BDRepository().getPlannings();
  }
}
