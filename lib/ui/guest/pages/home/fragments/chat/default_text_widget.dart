import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.maxLines = 2,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.align = TextAlign.center,
    this.fontFamily = "DMSans-Bold",
    this.textOverflow = TextOverflow.ellipsis,
    this.decoration = TextDecoration.none,
    this.withSp = true,
  });

  final String text;
  final Color color;
  final int maxLines;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign align;
  final String fontFamily;
  final TextOverflow textOverflow;
  final TextDecoration decoration;
  final bool withSp;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      maxLines: maxLines,
      style: TextStyle(
        color: color,
        fontSize: fontSize.sp  ,
        fontFamily: fontFamily,
        overflow: textOverflow,
        fontWeight: fontWeight,
        decoration: decoration,
        
      ),
    );
  }
}


