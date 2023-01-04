import 'package:flutter/material.dart';

class ThemeContainer extends StatelessWidget {
  const ThemeContainer({
    super.key,
    required this.color,
  });

  final Color color;
  final Color? ShadowColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      color: color,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5.0), boxShadow: [
        BoxShadow(
          color: ShadowColor!,
          offset: const Offset(0.0, 0.1),
          blurRadius: 2.0,
        )
      ]),
    );
  }
}
