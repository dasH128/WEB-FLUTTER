import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:data_table_2/data_table_2.dart';

import 'package:sistema_web/src/entities/worker.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class WorkersScreen extends StatelessWidget {
  const WorkersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WorkerEntity> workers = [
      WorkerEntity(
        nombre: 'Jeferson 1',
        apellidos: 'Quinto Povis',
        dni: '12345678',
        correo: 'jeferson1@gmail.com',
      ),
      WorkerEntity(
        nombre: 'Jeferson 2',
        apellidos: 'Quinto Povis',
        dni: '12345678',
        correo: 'jeferson1@gmail.com',
      ),
      WorkerEntity(
        nombre: 'Jeferson 3',
        apellidos: 'Quinto Povis',
        dni: '12345678',
        correo: 'jeferson1@gmail.com',
      ),
      WorkerEntity(
        nombre: 'Jeferson 4',
        apellidos: 'Quinto Povis',
        dni: '12345678',
        correo: 'jeferson1@gmail.com',
      ),
      WorkerEntity(
        nombre: 'Jeferson 5',
        apellidos: 'Quinto Povis',
        dni: '12345678',
        correo: 'jeferson1@gmail.com',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trabajadores'),
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
              child: Row(
                children: [
                  const Expanded(
                    child: TextFormFieldStyle1Widget(
                      prefixIcon: Icon(Icons.search_rounded),
                      label: 'Buscar',
                    ),
                  ),
                  IconButton(
                    onPressed: () =>
                        context.go('/dashboard/trabajadores-crear'),
                    icon: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: _TableDataWorkers(workers: workers),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TableDataWorkers extends StatelessWidget {
  final List<WorkerEntity> workers;
  const _TableDataWorkers({
    super.key,
    required this.workers,
  });

  @override
  Widget build(BuildContext context) {
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
        DataColumn(
          label: Text('DNI'),
        ),
        DataColumn(
          label: Text('Correo'),
        ),
        DataColumn2(
          fixedWidth: 100,
          label: Text('Opciones'),
        ),
      ],
      rows: [
        ...workers.map(
          (w) => DataRow(cells: [
            DataCell(Text(w.nombre)),
            DataCell(Text(w.apellidos)),
            DataCell(Text(w.dni)),
            DataCell(Text(w.correo)),
            DataCell(Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.push('/dashboard/trabajadores-crear');
                  },
                  icon: const Icon(Icons.info),
                )
              ],
            )),
          ]),
        ),
      ],
    );
  }
}
