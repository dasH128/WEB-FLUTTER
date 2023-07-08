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
    var styleTitle = styleNormal.copyWith(
      color: color.background,
    );
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('PLANIFICACIÓN FCOM',
                        style: styleNormal.copyWith(
                          color: color.onBackground,
                        )),
                    Text('DIFERENCIA',
                        style: styleNormal.copyWith(
                          color: color.onBackground,
                        )),
                    Text('ATENTO',
                        style: styleNormal.copyWith(
                          color: color.onBackground,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('ISLA', style: styleTitle)),
                          DataColumn(label: Text('VALOR', style: styleTitle)),
                        ],
                        rows: [
                          ...Iterable<int>.generate(resul1.length).map((i) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    planning.call1[i][0],
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    planning.call1[i][1],
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: color.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Center(
                              child: Text('VALOR', style: styleTitle),
                            ),
                          ),
                          DataColumn(
                            label: Text('DIFERENCIA', style: styleTitle),
                          )
                        ],
                        rows: [
                          ...Iterable<int>.generate(resul1.length).map((i) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    '${resul1[i]}',
                                    style: styleNormal.copyWith(
                                      color: (resul1[i] < 0)
                                          ? Colors.red
                                          : Colors.green[900],
                                    ),
                                  ),
                                )),
                                DataCell(
                                  Text(
                                    (resul1[i] < 0)
                                        ? 'FALTA QR'
                                        : 'RQ CONFORME',
                                    style: styleNormal.copyWith(
                                        color: (resul1[i] < 0)
                                            ? Colors.red
                                            : Colors.green[900]),
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: color.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('ISLA', style: styleTitle)),
                          DataColumn(label: Text('VALOR', style: styleTitle)),
                        ],
                        rows: [
                          ...Iterable<int>.generate(resul1.length).map((i) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    planning.call2?[i][0] ?? '---',
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    planning.call2?[i][1] ?? '---',
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              //
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: color.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('ISLA', style: styleTitle)),
                          DataColumn(label: Text('VALOR', style: styleTitle)),
                        ],
                        rows: [
                          ...Iterable<int>.generate(resul2.length).map((i) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    planning.parlo1[i][0],
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    planning.parlo1[i][1],
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: color.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
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
                          ...Iterable<int>.generate(resul2.length).map((i) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    '${resul2[i]}',
                                    style: styleNormal.copyWith(
                                      color: (resul2[i] < 0)
                                          ? Colors.red
                                          : Colors.green[900],
                                    ),
                                  ),
                                )),
                                DataCell(
                                  Text(
                                    (resul2[i] < 0)
                                        ? 'FALTA QR'
                                        : 'RQ CONFORME',
                                    style: styleNormal.copyWith(
                                        color: (resul2[i] < 0)
                                            ? Colors.red
                                            : Colors.green[900]),
                                  ),
                                )
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: color.onPrimaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('ISLA', style: styleTitle)),
                          DataColumn(label: Text('VALOR', style: styleTitle)),
                        ],
                        rows: [
                          ...Iterable<int>.generate(resul2.length).map((i) {
                            return DataRow(
                              cells: [
                                DataCell(Center(
                                  child: Text(
                                    planning.parlo2?[i][0] ?? '---',
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                                DataCell(Center(
                                  child: Text(
                                    planning.parlo2?[i][1] ?? '---',
                                    style: styleNormal.copyWith(
                                      color: color.background,
                                    ),
                                  ),
                                )),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
