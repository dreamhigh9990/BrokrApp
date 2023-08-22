// ignore_for_file: must_be_immutable

import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as sp;
import 'package:flutter_svg/svg.dart';

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
            fontSize: fontSize!.sp,
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

  StarsWidgetRight({
    super.key,
    required this.rating,
    required this.size,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
   
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.star_rate_rounded,
              color: ThemeUtils.colorPurple, size: size),
          const SizedBox(
            width: 0,
          ),
          Text(
            rating.toString(),
            style: TextStyle(color: Colors.grey, fontSize: fontSize!.sp),
          ),
        ],
      ),
    );
  }
}
