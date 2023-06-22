import 'package:flutter/material.dart';
import 'package:sistema_web/src/widgets/widgets.dart';

class ProgramationsScreen extends StatelessWidget {
  const ProgramationsScreen({super.key});

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
