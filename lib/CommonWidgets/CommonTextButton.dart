
import 'package:e_shop/Constants/style.dart';
import 'package:flutter/material.dart';


class CommonTextButton extends StatelessWidget {
  CommonTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: sTextButton,
        ));
  }
}
