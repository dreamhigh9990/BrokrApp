// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class StarsWidget extends StatelessWidget {
  final double rating;
  final double size;
  double? fontSize;

  StarsWidget({
    super.key,
    required this.rating,
    required this.size,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "0.0",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
        for (var i = 0; i < rating.toInt(); i++)
          Icon(Icons.star, color: const Color(0xFFFA9F16), size: size),
        rating % 1 == 0
            ? Container()
            : Icon(Icons.star_half_outlined,
                color: const Color(0xFFFA9F16), size: size),
        for (var i = 0; i < (5 - rating).toInt(); i++)
          Icon(Icons.star_border_outlined,
              color: const Color(0xFFFA9F16), size: size)
      ],
    );
  }
}

class StarsWidgetRight extends StatelessWidget {
  final double rating;
  final double size;
    double? fontSize;
  

   StarsWidgetRight({super.key, required this.rating, required this.size,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        for (var i = 0; i < rating.toInt(); i++)
          Icon(Icons.star, color: const Color(0xFFFA9F16), size: size),
        rating % 1 == 0
            ? Container()
            : Icon(Icons.star_half_outlined,
                color: const Color(0xFFFA9F16), size: size),
        for (var i = 0; i < (5 - rating).toInt(); i++)
          Icon(Icons.star_border_outlined,
              color: const Color(0xFFFA9F16), size: size),
         AutoSizeText(
          "(4.0)",
          style: TextStyle(color: Colors.grey,fontSize:fontSize),
        ),
      ],
    );
  }
}
