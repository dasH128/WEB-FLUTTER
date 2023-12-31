import 'package:flutter/material.dart';

class TextDateStyle1Widget extends StatelessWidget {
  final String value;
  final String label;
  final String? hint;
  final String? initialValue;
  final Widget? prefixIcon;
  final bool enabled;
  final String? errorMesagge;
  final Color colorError;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  const TextDateStyle1Widget({
    super.key,
    required this.value,
    required this.label,
    this.hint,
    this.initialValue,
    this.enabled = true,
    this.errorMesagge,
    this.colorError = const Color(0xFFC62828),
    this.onChanged,
    this.onTap,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
            color: color.primary
                .withOpacity(0.1), //color.primary.withOpacity(0.1),
            border: Border.all(color: color.primary),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8, left: 8),
              child: prefixIcon,
            ),
            Text((value.isEmpty) ? label : value)
          ],
        ),
      ),
    );
  }
}
