import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class ProgramationAddScreen extends StatefulWidget {
  final PlanningEntity planning;
  const ProgramationAddScreen({
    super.key,
    required this.planning,
  });

  @override
  State<ProgramationAddScreen> createState() => _ProgramationAddScreenState();
}

class _ProgramationAddScreenState extends State<ProgramationAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('creaciòn')),
      body: Container(
        // color: Colors.amber,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: TextOptionStyle1Widget(
                    label: 'hola',
                    listOption: [],
                  ),
                ),
              ],
            ),
            Text('a'),
            Text('asd')
          ],
        ),
      ),
    );
  }
}

class _TableDataPlanning extends StatelessWidget {
  final List<PlanningEntity> plannings;
  const _TableDataPlanning({
    super.key,
    required this.plannings,
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
          label: Text('Asunto'),
          size: ColumnSize.L,
        ),
        DataColumn2(
          label: Text('fecha'),
        ),
        DataColumn2(
          fixedWidth: 100,
          label: Text('Opciones'),
        ),
      ],
      rows: [
        ...plannings.map(
          (p) => DataRow(cells: [
            DataCell(Text(p.asunto)),
            DataCell(Text(p.fecha)),
            DataCell(Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.push('/dashboard/programacion-crear');
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
