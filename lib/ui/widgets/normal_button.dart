import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NormalButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final Color backgroundColor;

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final int? maxTextLines;
  final double? textSize;
  final double cornersRadius;
  final bool applyWidth;
  final bool emptyBackground;

  final Color? colorText;

  final Color? colorBorder;

  final FontWeight weight;

  const NormalButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.colorBorder = Colors.transparent,
    this.colorText = Colors.white,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.all(0),
    this.width,
    this.height = 50,
    this.maxTextLines,
    this.textSize,
    this.cornersRadius = 8,
    this.applyWidth = true,
    this.emptyBackground = false,
    this.weight = FontWeight.w500,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: applyWidth ? width ?? double.infinity : null,
        height: height,
        alignment: Alignment.center,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
         border: Border.all(
          color: colorBorder!,
          width: 0.5
         ),
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(cornersRadius),
          ),
        ),
        child: Text(
          text,
          maxLines: maxTextLines,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontFamily: ThemeUtils.interRegular,
            color: colorText,
            fontSize: (textSize ?? 16).sp,
            fontWeight: weight,
          ),
        ),
      ),
    );
  }
}
