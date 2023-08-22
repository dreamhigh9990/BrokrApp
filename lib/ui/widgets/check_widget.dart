
import 'package:flutter/material.dart';

class CheckWidget extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const CheckWidget({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: SizedBox(
        height: 16,
        width: 16,
        child: Image.asset(
          value
              ? 'assets/icons/checked_icon.png'
              : 'assets/icons/unchecked_icon.png',
        ),
      ),
    );
  }
}
