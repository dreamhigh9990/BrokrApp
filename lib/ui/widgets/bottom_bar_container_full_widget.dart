


import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/theme_utils.dart';
import 'normal_button.dart';


class BottomBarContainerFullWidget extends StatelessWidget {
  final Function ontap;
  final  String title;
  const BottomBarContainerFullWidget({super.key, required this.ontap, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
          height: Get.context!.height * 0.10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ThemeUtils.dividerGrey,
              Padding(
                padding: EdgeInsets.only(
                  left: Get.context!.width * 0.05,
                  right: Get.context!.width * 0.05,
                ),
                child: NormalButton(
                  backgroundColor: ThemeUtils.colorPurple,
                  text: title,
                  onTap: () {
                    ontap();
                  },
                  cornersRadius: 8,
                ),
              ),
            ],
          ),
        );
  }
}