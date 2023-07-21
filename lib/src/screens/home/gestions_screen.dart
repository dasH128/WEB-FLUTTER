import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sistema_web/src/provider/gestion_provider.dart';

class GestionsScreen extends StatelessWidget {
  const GestionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GESTION'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: const Column(
            children: [
              _ContainerHorarioFijosView(),
              _ContainerTurnoView(),
              SizedBox(height: 16),
              _ContainerPuestoView(),
              SizedBox(height: 16),
              _ContainerModalidadView(),
              SizedBox(height: 16),
              _ContainerOpcionView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContainerHorarioFijosView extends ConsumerWidget {
  const _ContainerHorarioFijosView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var horarios = ref.watch(horarioGeneral);
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 600,
          child: DataTable2(
            headingRowHeight: 150,
            showCheckboxColumn: true,
            columns: const[
              DataColumn2(
                label: Text(''),
                size: ColumnSize.L,
              ),
              // DataColumn2(
              //   label: Text('PArlo'),
              //   size: ColumnSize.L,
              // ),
              DataColumn2(
                label: Text('Nomemclatuta'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('BU'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('LU-VI'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('SABADOS'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('DOMINGO'),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text('FESTIVO'),
                size: ColumnSize.L,
              ),
            ],
            rows: [
              ...horarios.map((h) {
                return DataRow(
                    selected: false,
                    onSelectChanged: (v) {
                      print(v.toString());
                    },
                    cells: [
                      DataCell(Text('')),
                      // DataCell(
                      //   Text('Atento'),
                      // ),
                      DataCell(Text(h.nomenclatura)),
                      DataCell(Text(h.bu)),
                      DataCell(Text('${h.iniDay} - ${h.finDay}')),
                      DataCell(Text('${h.iniSat} - ${h.finSat}')),
                      DataCell(Text('${h.iniDom} - ${h.finDom}')),
                      DataCell(Text('${h.iniFes} - ${h.finFes}')),
                    ]);
              }),
            ],
          ),
        ));
  }
}

class _ContainerOpcionView extends ConsumerWidget {
  const _ContainerOpcionView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var options = ref.watch(optionProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'OPCIONES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 16),
          ...options.map(
            (o) => ListTile(
              title: Text(o.nombre),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainerModalidadView extends ConsumerWidget {
  const _ContainerModalidadView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var modalidades = ref.watch(modalityProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'MODALIDAD',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 16),
          ...modalidades.map(
            (m) => ListTile(
              title: Text(m.nombre),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainerPuestoView extends ConsumerWidget {
  const _ContainerPuestoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var puestos = ref.watch(positionProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'PUESTOS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 16),
          ...puestos.map(
            (p) => ListTile(
              title: Text(p.nombre),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContainerTurnoView extends ConsumerWidget {
  const _ContainerTurnoView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var turnos = ref.watch(turnProvider);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'TURNOS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(height: 16),
          ...turnos.map(
            (t) => ListTile(
              title: Text(t.nombre),
              subtitle: Text('${t.inicio}-${t.fin}'),
            ),
          ),
        ],
      ),
    );
  }
}
