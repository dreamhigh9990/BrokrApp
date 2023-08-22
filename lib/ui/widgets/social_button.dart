import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String icon;
  final Function() onTap;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final int? maxTextLines;
  final double? textSize;
  final double cornersRadius;
  final bool applyWidth;
  final bool emptyBackground;
  final Color backgroundColor;
  final Color colorSVG;
  final Color colorText;
  final double? widthIcon;
  final double? heightIcon;
  const SocialButton({
    Key? key,
    this.colorSVG = Colors.transparent,
    this.colorText = Colors.black,
    this.heightIcon = 24,
    this.widthIcon = 24,
    required this.text,
    required this.icon,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.width,
    this.height = 50,
    this.maxTextLines,
    this.textSize,
    this.cornersRadius = 8,
    this.applyWidth = true,
    this.emptyBackground = false,
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
          color: backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(cornersRadius),
          ),
          border: Border.all(
            width: 1,
            color: Colors.black.withOpacity(0.4),
          ),
        ),
        child: Row(
          children: [
            if (colorSVG != Colors.white) ...{
              SvgPicture.asset(
                icon,
                height: heightIcon,
                width: widthIcon,
              ),
            } else ...{
              SvgPicture.asset(
                icon,
                color: Colors.white,
                height: heightIcon,
                width: widthIcon,
              ),
            },
            Expanded(
              child: AutoSizeText(
                text,
                maxLines: maxTextLines,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: colorText,
                  fontSize: textSize ?? 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SvgPicture.asset(
              icon,
              color: Colors.transparent,
              width: 24,
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
