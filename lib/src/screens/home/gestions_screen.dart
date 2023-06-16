import 'package:flutter/material.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

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

class _ContainerOpcionView extends StatelessWidget {
  const _ContainerOpcionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: const Column(
        children: [
          Padding(
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
          ListTile(
            title: Text('SIN OPCIÓN'),
          ),
          ListTile(
            title: Text('OPCIÓN 1'),
          ),
          ListTile(
            title: Text('OPCIÓN 2'),
          ),
          ListTile(
            title: Text('OPCIÓN 3'),
          ),
          ListTile(
            title: Text('OPCIÓN 4'),
          ),
        ],
      ),
    );
  }
}

class _ContainerModalidadView extends StatelessWidget {
  const _ContainerModalidadView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: const Column(
        children: [
          Padding(
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
          ListTile(
            title: Text('PRESENCIAL'),
          ),
          ListTile(
            title: Text('WAHA'),
          ),
        ],
      ),
    );
  }
}

class _ContainerPuestoView extends StatelessWidget {
  const _ContainerPuestoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: const Column(
        children: [
          Padding(
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
          ListTile(
            title: Text('PLATAFORMA ATENTO'),
          ),
          ListTile(
            title: Text('ATENTO REMOTO'),
          ),
        ],
      ),
    );
  }
}

class _ContainerTurnoView extends StatelessWidget {
  const _ContainerTurnoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
      ),
      child: const Column(
        children: [
          Padding(
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
          ListTile(
            title: Text('MAÑANA'),
            subtitle: Text('8:00-2:00'),
          ),
          ListTile(
            title: Text('TARDE'),
            subtitle: Text('8:00-2:00'),
          ),
        ],
      ),
    );
  }
}
