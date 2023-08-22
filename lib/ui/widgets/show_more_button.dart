import 'package:flutter/material.dart';

class ShowMoreButton extends StatelessWidget {
  final VoidCallback pressedButton;
  final String text;
  final TextStyle style;

  const ShowMoreButton(
      {super.key,
      required this.pressedButton,
      required this.text,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)))),
        onPressed: pressedButton,
        child: Text(
          text,
          style: style,
        ));
  }
}
