import 'package:flutter/material.dart';

class TextOptionStyle1Widget<T> extends StatelessWidget {
  final List<T> listOption;
  final String label;
  final Widget? prefixIcon;
  const TextOptionStyle1Widget({
    super.key,
    required this.label,
    required this.listOption,
    this.prefixIcon = const Icon(Icons.widgets),
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: color.primary));

    return GestureDetector(
      onTap: () {},
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          disabledBorder: border,
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: border,
        ),
      ),
    );
  }
}
