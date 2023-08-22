import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme_utils.dart';

class SelectCountryWidget extends StatelessWidget {
  final String? countryName;
  final Function(Country) onSelect;

  const SelectCountryWidget({
    super.key,
    this.countryName,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return PickCountryButton(
        text: countryName ?? 'Select your Country/Region',
        cornersRadius: 8,
        onTap: () {
          showCountryPicker(
            context: context,
            onSelect: onSelect,
          );
        });
  }
}

class PickCountryButton extends StatelessWidget {
  final String text;
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

  const PickCountryButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.margin = const EdgeInsets.all(0),
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.width,
    this.height,
    this.maxTextLines,
    this.textSize,
    this.cornersRadius = 6,
    this.applyWidth = true,
    this.emptyBackground = false,
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
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(cornersRadius),
          ),
          border: Border.all(
            color: ThemeUtils.inputFocusedColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Country/Region',
                    style: TextStyle(
                      color: ThemeUtils.inputBorderColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    text,
                    maxLines: maxTextLines,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: textSize ?? 16,
                    ),
                  )
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/icons/drop_down.svg',
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
