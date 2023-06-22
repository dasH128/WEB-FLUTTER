import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:sistema_web/src/entities/entities.dart';

import 'package:sistema_web/src/repositories/bd_repository.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class PlanningAddScreen extends StatefulWidget {
  const PlanningAddScreen({super.key});

  @override
  State<PlanningAddScreen> createState() => _PlanningAddScreenState();
}

class _PlanningAddScreenState extends State<PlanningAddScreen> {
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
  String asunto = '';
  String fecha = '';
  List<List<String>> listTabla1 = [];
  List<List<String>> listTabla2 = [];

  @override
  void initState() {
    super.initState();
    generateDatos1();
    generateDatos2();
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planificaciones'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(listTabla1);
          guardar();
        },
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              const TextFormFieldStyle1Widget(
                prefixIcon: Icon(Icons.search_rounded),
                label: 'Asunto',
              ),
              const TextFormFieldStyle1Widget(
                prefixIcon: Icon(Icons.calendar_month_rounded),
                label: 'Fecha',
              ),
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Divider(height: 2),
              ),
              _HeaderTable('CALL', total1),
              SizedBox(
                height: 600,
                child: table1(),
              ),
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Divider(height: 2),
              ),
              _HeaderTable('PARLO', total2),
              SizedBox(
                height: 300,
                child: table2(),
              ),
              // Container(
              //   height: 400,
              //   child: ListView.builder(
              //     itemCount: 30,
              //     itemBuilder: (BuildContext c, int i) => Text('i: $i'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  sumarTotal1() {
    print('-----------------');
    total1 = 0;
    bool isVallid = true;
    listTabla1.map((List<String> e) {
      if (!isVallid) return;

      String val = e[1];
      int? n = int.tryParse(val);
      if (n == null) {
        total1 = 0;
        isVallid = false;
        return;
      }
      total1 = (total1 + n);
    }).toList();
  }

  guardar() async {
    await BDRepository().createPlanning(PlanningEntity(
      asunto: asunto,
      fecha: fecha,
      call1: listTabla1,
      parlo1: listTabla2,
    ));

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
                listTabla1[index][1] = p0;
                print('listTabla1 ${listTabla1.toString()}');
                sumarTotal1();
                print('toal $total1');
                setState(() {});
                // int? n = int.tryParse(p0);
                // total1 = (n == null) ? 0 : (total1 + n);
                // listTabla1[index][1] = p0;
                // setState(() {});
              },
            )),
            DataCell(TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.numbers),
              initialValue: listTabla1[index][2],
              onChanged: (p0) {
                // int? n = int.tryParse(p0);
                // total1 = (n == null) ? 0 : (total1 + n);
                // listTabla1[index][2] = p0;
                // setState(() {});
              },
            )),
            DataCell(TextFormFieldStyle1Widget(
              prefixIcon: const Icon(Icons.numbers),
              initialValue: listTabla1[index][3],
              onChanged: (p0) {
                // int? n = int.tryParse(p0);
                // total1 = (n == null) ? 0 : (total1 + n);
                // listTabla1[index][3] = p0;
                // setState(() {});
              },
            )),
          ]),
        ).toList()
        /*...listTabla1.map(
          (e) => DataRow(
            cells: [
              DataCell(Text(e.first)),
              DataCell(TextFormFieldStyle1Widget(
                prefixIcon: const Icon(Icons.numbers),
                label: '',
                onChanged: (p0) {
                  print('e:$e $p0');
                  listTabla1.
                },
              )),
              DataCell(TextFormFieldStyle1Widget(
                prefixIcon: Icon(Icons.numbers),
                label: '',
              )),
              DataCell(TextFormFieldStyle1Widget(
                prefixIcon: Icon(Icons.numbers),
                label: '',
              )),
            ],
          ),
        ),*/
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
                        setState(() {
                          int? n = int.tryParse(p0);
                          total2 = (n == null) ? 0 : (total2 + n);
                          listTabla2[index][1] = p0;
                          setState(() {});
                          //listTabla2[index][1] = p0;
                        });
                      },
                    )),
                  ],
                )).toList()
      ],
    );
  }
}

class _HeaderTable extends StatelessWidget {
  final String texto;
  final int total;
  const _HeaderTable(this.texto, this.total);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        '   $texto   $total',
        style: const TextStyle(fontSize: 32),
      ),
    );
    return Row(
      children: [
        SizedBox(
          width: 300,
          height: 68,
          child: TextFormFieldStyle1Widget(
            prefixIcon: const Icon(Icons.data_array),
            label: texto,
          ),
        ),
        SizedBox(
          width: 300,
          height: 68,
          child: TextFormFieldStyle1Widget(
            prefixIcon: const Icon(Icons.data_array),
            label: '$total',
          ),
        ),
      ],
    );
  }
}
