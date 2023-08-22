// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';

class TextAlignLeft extends StatelessWidget {
  final String title;
  double fontsize;
  Color? color;
  String? fontFamily;

  TextAlignLeft(
      {super.key,
      required this.title,
      this.fontsize = 18,
      this.fontFamily = "Inter-Bold",
      this.color = const Color(0xFF505050)});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: AutoSizeText(
        title,
        style: TextStyle(
          fontSize: fontsize,
          color: color,
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}
