

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';



class LinealRowText extends StatelessWidget {
  final String title;

  const LinealRowText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0x80B6B1B1),
          ),
        ),
        const SizedBox(width: 16),
        AutoSizeText(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0x80B6B1B1),
          ),
        ),
      ],
    );
  }
}