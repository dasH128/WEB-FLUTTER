import 'package:flutter/material.dart';

class IslandAddScreen extends StatelessWidget {
  const IslandAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 36,
        ),
        child: Column(
          children: [
            Text(
              'CREAR ISLA',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
