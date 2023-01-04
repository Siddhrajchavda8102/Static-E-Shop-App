import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField(
      {super.key,
      required this.labelText,
      this.fillColor = Colors.white,
      this.border,
      this.filled = true,
      this.obscureText = false});

  final String labelText;
  final Color fillColor;
  final InputBorder? border;
  final bool filled;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: labelText,
        filled: filled,
        fillColor: fillColor ?? Colors.white,

        // border: border ?? OutlineInputBorder()
      ),
    );
  }
}
