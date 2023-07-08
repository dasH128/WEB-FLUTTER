import 'package:flutter/material.dart';

class ButtonStyle1Widget extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  const ButtonStyle1Widget({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return MaterialButton(
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: color.surface,
      onPressed: onPressed,
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
