import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sistema_web/src/entities/entities.dart';
import 'package:sistema_web/src/repositories/bd_repository.dart';
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
  late int maxCAlL = 0;
  late int maxPARLO = 0;

  final List<String> calls = [
    "FCOM CL",
    "FCOM PE",
    "FACL",
    "FAPE",
    "TOCL",
    "TOPE",
    "SOPE"
  ];
  final List<String> calls2 = [
    "FACL",
    "FAPE",
    "FCOM PE",
  ];
  final List<String> operations = ["OPCION 3", "OPCION 4"];
  int total1 = 0;
  int total2 = 0;
  List<List<String>> listTabla1 = [];
  List<List<String>> listTabla2 = [];

  generateDatos1() {
    Iterable<int>.generate(calls.length).map((i) {
      var item =
          List.generate(4, (index) => (index == 0) ? calls.elementAt(i) : '0');
      listTabla1.add(item);
    }).toList();

    setState(() {});
  }

  generateDatos2() {
    Iterable<int>.generate(calls2.length).map((i) {
      var item =
          List.generate(2, (index) => (index == 0) ? calls2.elementAt(i) : '0');
      listTabla2.add(item);
    }).toList();
  }

  @override
  void initState() {
    super.initState();
    generateDatos1();
    generateDatos2();
    maxCAlL = calcularTotalMaximoCall1();
    maxPARLO = calcularTotalMaximoParlo1();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Programación'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Desea Guardar '),
                content: const Text('Esta seguro de gaurdar la programación'),
                actions: [
                  TextButton(onPressed: () {}, child: Text('Cancel')),
                  FilledButton(
                      onPressed: () {
                        guardar();
                      },
                      child: const Text('OK')),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Text(
                    'TOTAL PROPUESTO ${maxCAlL + maxPARLO}',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    child: Text(
                      'FECHA ${widget.planning.fecha}',
                      style: const TextStyle(fontSize: 22),
                    )),
                const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Divider(height: 2),
                ),
                _HeaderTable('CALL', total1, maxCAlL),
                SizedBox(
                  height: 600,
                  child: table1(),
                ),
                const Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Divider(height: 2),
                ),
                _HeaderTable('PARLO', total2, maxPARLO),
                SizedBox(
                  height: 300,
                  child: table2(),
                ),
              ],
            )),
      ),
    );
  }

  guardar() async {
    String id = widget.planning.id!;
    bool isCreated = await BDRepository().createProgramation(
      id: id,
      call2: listTabla1,
      parlo2: listTabla2,
    );
    if (isCreated == true) {
      context.pop();
    } else {}
    context.pop();
  }

  Widget table1() {
    return DataTable2(
      dataRowHeight: 68,
      columns: [
        const DataColumn2(label: Text('OPERACION')),
        const DataColumn2(label: Text('RQ')),
        ...operations.map((o) => DataColumn2(label: Text(o))).toList()
      ],
      rows: [
        ...List.generate(
          listTabla1.length,
          (index) => DataRow(cells: [
            DataCell(Text(listTabla1[index].first)),
            DataCell(TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.numbers),
              initialValue: listTabla1[index][1],
              onChanged: (p0) {
                // listTabla1[index][1] = p0;
                // print('listTabla1 ${listTabla1.toString()}');
                // sumarTotal1();
                // print('toal $total1');
                // setState(() {});
              },
            )),
            DataCell(TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.numbers),
              initialValue: listTabla1[index][2],
              onChanged: (p0) {},
            )),
            DataCell(TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.numbers),
              initialValue: listTabla1[index][3],
              onChanged: (p0) {},
            )),
          ]),
        ).toList()
      ],
    );
  }

  Widget table2() {
    return DataTable2(
      dataRowHeight: 68,
      columns: const [
        DataColumn2(label: Text('OPERACION')),
        DataColumn2(label: Text('RQ')),
      ],
      rows: [
        ...List.generate(
            listTabla2.length,
            (index) => DataRow(
                  cells: [
                    DataCell(Text(listTabla2[index].first)),
                    DataCell(TextFormFieldStyle1Widget(
                      prefixIcon: const Icon(Icons.numbers),
                      initialValue: listTabla2[index][1],
                      onChanged: (p0) {
                        // listTabla2[index][1] = p0;
                        // sumarTotal2();
                        // setState(() {});
                      },
                    )),
                  ],
                )).toList()
      ],
    );
  }

  int calcularTotalMaximoCall1() {
    int t = 0;
    List<List<String>> tCall1 = widget.planning.call1;
    for (var e in tCall1) {
      t = t + int.parse(e[1]);
    }
    return t;
  }

  calcularTotalMaximoParlo1() {
    int t = 0;
    List<List<String>> tParlo1 = widget.planning.parlo1;
    for (var e in tParlo1) {
      t = t + int.parse(e[1]);
    }
    return t;
  }
}

class _HeaderTable extends StatelessWidget {
  final String texto;
  final int total;
  final int max;
  const _HeaderTable(this.texto, this.total, this.max);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        '   $texto   $total  |  $max',
        style: const TextStyle(fontSize: 32),
      ),
    );
  }
}
