import 'package:flutter/material.dart';


class LargeButton extends StatelessWidget {
  const LargeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color 
  });

  final String text;
  final Color? color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: color ?? Colors.amber,
        minimumSize: Size(350, 50),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
