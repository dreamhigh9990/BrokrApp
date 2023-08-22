// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/theme_utils.dart';

class IconRadioButton extends StatelessWidget {
  final String iconPath;
  final String text;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;

  const IconRadioButton(
      {super.key,
      required this.iconPath,
      required this.text,
      required this.value,
      required this.groupValue,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        height: 80,
        width: 80,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
            color: groupValue == value ? ThemeUtils.colorPurple : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
                color: groupValue == value ? Colors.transparent : Colors.black,
                width: 1)),
        child: Column(
          children: [
            SvgPicture.asset(
              iconPath,
              color: groupValue == value ? Colors.white : Colors.black,
              width: 20,
              height: 20,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(
                color: groupValue == value ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconRadioButton2 extends StatelessWidget {
  final String iconPath;
  final String text;
  final int value;
  final int groupValue;
  final ValueChanged<int> onChanged;
  final Color borderColor;
  double? width;

   IconRadioButton2(
      {super.key,
      this.width = 30,
      required this.iconPath,
      required this.text,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      this.borderColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        decoration: BoxDecoration(
          color: groupValue == value ? Colors.white : const Color(0xFFF7F7F7),
          borderRadius: BorderRadius.circular(52),
          boxShadow: groupValue == value
              ? [
                  const BoxShadow(
                 color: Color.fromRGBO(0, 0, 0, 0.25),
        offset: Offset(0, 1),
        blurRadius: 8,
                  ),
                ]
              : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: width,
              color:
                  groupValue == value ? ThemeUtils.colorPurple :const Color(0xFF676A6F),
            ),
           const SizedBox(width: 10.0,),
            Text(
              text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color:
                    groupValue == value ? ThemeUtils.colorPurple :const Color(0xFF676A6F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
