import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/icon_radio_button.dart';

class TabButtomWidget extends StatelessWidget {
  final Function function;

  final int groupValue;
  const TabButtomWidget(
      {super.key, required this.function, required this.groupValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.025),
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(52),
      ),
      margin: ThemeUtils.paddingScaffoldx035,
      padding: EdgeInsets.only(
          top: 3.5,
          bottom: 3.5,
          left: Get.context!.width * 0.015,
          right: Get.context!.width * 0.015),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: Get.context!.width * 0.27,
            child: AspectRatio(
              aspectRatio: 3,
              child: IconRadioButton2(
                width: 15,
                iconPath: 'assets/icons/car.svg',
                text: 'Cars',
                value: 0,
                groupValue: groupValue,
                onChanged: (int value) => function(value),
                borderColor: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: Get.context!.width * 0.27,
            child: AspectRatio(
              aspectRatio: 3,
              child: IconRadioButton2(
                width: 15,
                iconPath: 'assets/icons/stays.svg',
                text: 'Stays',
                value: 1,
                groupValue: groupValue,
                onChanged: (int value) => function(value),
                borderColor: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: Get.context!.width * 0.27,
            child: AspectRatio(
              aspectRatio: 3,
              child: IconRadioButton2(
                width: 15,
                iconPath: 'assets/icons/boat.svg',
                text: 'Boats',
                value: 2,
                groupValue: groupValue,
                onChanged: (int value) => function(value),
                borderColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
