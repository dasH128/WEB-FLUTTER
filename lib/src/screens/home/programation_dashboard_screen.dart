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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  child: Column(
                    children: [
                      Text('data'),
                      Text('data'),
                      Text('data'),
                      Text('data'),
                    ],
                  ),
                ),
              ),
              // Container(
              //   child: Text('asd'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
