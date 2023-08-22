import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';
import '../../stars_widget.dart';

class HeaderTitleItemWidget extends StatelessWidget {
  final String title;
  final String owner;
  final String address;
  final String description;
  final double rating;
  final double bath;
  bool? showdDivider;
  bool? showPrice;

  HeaderTitleItemWidget({
    super.key,
    required this.title,
    required this.owner,
    required this.address,
    required this.description,
    required this.rating,
    required this.bath,
    
    this.showdDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     
      //color: Colors.red,
      height: Get.context!.height * 0.1250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              StarsWidgetRight(
                rating: rating,
                size: 20,
              ),
              const SizedBox(width: 8),
              Container(
                height: 15.0,
                width: 2.5,
                color: Colors.black,
              ),
              const SizedBox(width: 8),
              SvgPicture.asset(
                'assets/icons/super_host_icon.svg',
                height: 10,
              ),
              Text(
                " Host Name Lastname",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 12.sp,
                      color: const Color(0xFF646464),
                    ),
              ),
            ],
          ),
          Text(
            title,
            style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
          ),
          
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Icon(Icons.location_on_sharp,
                color: Color(0xFF646464), size: 15),
            const SizedBox(
              width: 2.5,
            ),
            AutoSizeText(
              address,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontSize: 10,
                    color: const Color(0xFF646464),
                  ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Container(
              height: 5.0,
              width: 5.0,
              decoration: const BoxDecoration(
                  color: Color(0xFF646464), shape: BoxShape.circle),
            ),
            const SizedBox(
              width: 10.0,
            ),
            const AutoSizeText(
              "11.6 mi",
              style: TextStyle(
                color: Color(0xFF646464),
              ),
            ),
          ]),
          if (showdDivider!) ...{ThemeUtils.dividerGrey},
          
        ],
      ),
    );
  }
}
