import 'package:flutter/material.dart';

class TextOptionStyle1Widget<T> extends StatelessWidget {
  // final List<T> listOption;
  final String label;
  final Widget? prefixIcon;
  final Function()? onTap;
  const TextOptionStyle1Widget({
    super.key,
    required this.label,
    // required this.listOption,
    this.prefixIcon = const Icon(Icons.widgets),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    var colorPrimary = color.primary;
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
    );

    return GestureDetector(
      onTap: onTap,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
          disabledBorder: border.copyWith(
            borderSide: BorderSide(color: colorPrimary),
          ),
          enabledBorder: border,
          focusedBorder: border.copyWith(
            borderSide: BorderSide(color: colorPrimary),
          ),
          errorBorder: border.copyWith(
            borderSide: BorderSide(color: Color(0xFFC62828)),
          ),
          focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: Color(0xFFC62828)),
          ),
          filled: true,
          fillColor: colorPrimary.withOpacity(0.1),
          focusColor: colorPrimary,
          prefixIcon: prefixIcon,
          label: Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          // disabledBorder: border,
          // enabledBorder: border,
          // focusedBorder: border,
          // errorBorder: border,
        ),
      ),
    );
  }
}
