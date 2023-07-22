import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuOptionWidget extends StatelessWidget {
  final String option;
  final String? svgSrc;
  final void Function() press;

  const MenuOptionWidget({
    required this.option,
    required this.press,
    this.svgSrc = 'assets/icons/menu_task.svg',
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.onPrimaryContainer,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgSrc!,
              colorFilter: ColorFilter.mode(color.onSecondary, BlendMode.srcIn),
              height: 46,
            ),
            const SizedBox(height: 16),
            Text(
              option,
              style: TextStyle(
                color: color.background,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
