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
    var styleNormal = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    // var n = planning.call1.length;
    List<int> resul1 = [];
    List<int> resul2 = [];
    for (int i = 0; i < planning.call1.length; i++) {
      int i1 = int.parse(planning.call1[i][1]);
      int i2 = int.parse(planning.call2?[i][1] ?? '0');
      resul1.add(i2 - i1);
    }
    for (int i = 0; i < planning.parlo1.length; i++) {
      int i1 = int.parse(planning.parlo1[i][1]);
      int i2 = int.parse(planning.parlo2?[i][1] ?? '0');
      resul2.add(i2 - i1);
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
                width: 380,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Center(
                          child: Text(
                            'VALOR',
                            style: styleNormal.copyWith(
                              color: color.background,
                            ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'DIFERENCIA',
                          style: styleNormal.copyWith(
                            color: color.background,
                          ),
                        ),
                      )
                    ],
                    rows: [
                      ...resul1
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    '$e',
                                    style: styleNormal.copyWith(
                                      color: (e < 0)
                                          ? Colors.red
                                          : Colors.green[900],
                                    ),
                                  ),
                                )),
                                DataCell(
                                  Text(
                                    (e < 0) ? 'FALTA QR' : 'RQ CONFORME',
                                    style: styleNormal.copyWith(
                                        color: (e < 0)
                                            ? Colors.red
                                            : Colors.green[900]),
                                  ),
                                )
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
                width: 370,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.onPrimaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  child: DataTable(
                    columns: [
                      DataColumn(
                          label: Center(
                        child: Text(
                          'VALOR',
                          style: styleNormal.copyWith(
                            color: color.background,
                          ),
                        ),
                      )),
                      DataColumn(
                          label: Text(
                        'DIFERENCIA',
                        style: styleNormal.copyWith(
                          color: color.background,
                        ),
                      ))
                    ],
                    rows: [
                      ...resul2
                          .map(
                            (e) => DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text('$e',
                                      style: styleNormal.copyWith(
                                        color: (e < 0)
                                            ? Colors.red
                                            : Colors.green[900],
                                      )),
                                )),
                                DataCell(Text(
                                  (e < 0) ? 'FALTA QR' : 'RQ CONFORME',
                                  style: styleNormal.copyWith(
                                      color: (e < 0)
                                          ? Colors.red
                                          : Colors.green[900]),
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
