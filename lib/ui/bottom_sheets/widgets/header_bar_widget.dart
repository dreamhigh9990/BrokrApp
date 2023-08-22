import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';

class HeaderBarWidget extends StatelessWidget {
  final String title;
  bool? radius;

  Function? functionClear;

  HeaderBarWidget({
    super.key,
    required this.title,
    this.radius = false,
    this.functionClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: radius == false
                ? const BorderRadius.only()
                : const BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/close_cancel.svg",
                        height: 20,
                      )),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ThemeUtils.interRegular),
                  ),
                  MaterialButton(
                    minWidth: 15,
                    height: 25,
                    padding: const EdgeInsets.all(0.0),
                    onPressed: () {
                      functionClear!();
                    },
                    child: Text(
                      "Clear",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: ThemeUtils.colorPurple,
                          fontFamily: ThemeUtils.interRegular),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ThemeUtils.dividerGrey,
            const SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }
}

class HeaderBarWidgetNoClear extends StatelessWidget {
  final String title;

  HeaderBarWidgetNoClear({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    
        decoration: const BoxDecoration(
           // color: Colors.red,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        child: Column(
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        "assets/icons/close_cancel.svg",
                        height: 20,
                      )),
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ThemeUtils.interRegular),
                  ),

                       SvgPicture.asset(
                         "assets/icons/close_cancel.svg",
                         height: 20,
                         color: Colors.transparent,
                       ),
                ],
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            ThemeUtils.dividerGrey,
            const SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }
}
