import 'dart:js_interop';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:sistema_web/src/entities/entities.dart';

class ProgramationDashboardScreen extends StatelessWidget {
  final PlanningEntity planning;
  const ProgramationDashboardScreen({
    super.key,
    required this.planning,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    // var n = planning.call1.length;
    List<int> resul1 = [];
    List<int> resul2 = [];
    for (int i = 0; i < planning.call1.length; i++) {
      int i1 = int.parse(planning.call1[i][1]);
      int i2 = int.parse(planning.call2?[i][1] ?? '0');
      resul1.add(i1 - i2);
    }
    for (int i = 0; i < planning.parlo1.length; i++) {
      int i1 = int.parse(planning.parlo1[i][1]);
      int i2 = int.parse(planning.parlo2?[i][1] ?? '0');
      resul2.add(i1 - i2);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('VALOR')),
                      DataColumn(label: Text('DIFERENCIA'))
                    ],
                    rows: [
                      ...resul1
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(Text('$e')),
                                DataCell(Text(
                                  (e < 0) ? 'FALTA QR' : 'RQ CONFORME',
                                ))
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
              //
              Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('VALOR')),
                      DataColumn(label: Text('DIFERENCIA'))
                    ],
                    rows: [
                      ...resul2
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(Text('$e')),
                                DataCell(Text(
                                  (e < 0) ? 'FALTA QR' : 'RQ CONFORME',
                                ))
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
