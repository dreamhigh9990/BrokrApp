import 'package:brokr/ui/guest/pages/home/fragments/car/car_camera_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/theme_utils.dart';

class ButtonActionWidget extends StatelessWidget {
  final int? index;
  final String title;
  final String svg;
  final Function callback;
  ButtonActionWidget(
      {super.key,
      required this.callback,
      required this.title,
      required this.svg,
      required this.index});

  final CarCameraController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        callback();

        controller.pageController.animateToPage(index!,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
      child: Container(
        height: Get.context!.height * 0.0825,
        width: Get.context!.width * 0.185,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 1.0,
                offset: const Offset(0, 1),
              ),
            ],
            color: const Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(13)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              child: SvgPicture.asset(
                "assets/aside/$svg.svg",
                width: Get.context!.width * 0.02,
                height: Get.context!.height * 0.025,
                fit: BoxFit.contain,
                color: controller.index == index
                    ? ThemeUtils.colorPurple
                    : ThemeUtils.colorbottomBar,
              ),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                color: controller.index == index
                    ? ThemeUtils.colorPurple
                    : ThemeUtils.colorbottomBar,
                fontFamily: ThemeUtils.interRegular,
              ),
            )
          ],
        ),
      ),
    );
  }
}
