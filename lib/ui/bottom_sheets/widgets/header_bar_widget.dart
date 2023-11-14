import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';

class HeaderBarWidget extends StatelessWidget {
  final String title;

  const HeaderBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: SvgPicture.asset("assets/icons/close_cancel.svg")),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: ThemeUtils.interRegular),
          ),
          MaterialButton(
            minWidth: 15,
            height: 25,
            padding: const EdgeInsets.all(0.0),
            onPressed: () {
              Get.back();
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
    );
  }
}
