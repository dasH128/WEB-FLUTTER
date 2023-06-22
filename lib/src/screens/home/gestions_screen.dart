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
