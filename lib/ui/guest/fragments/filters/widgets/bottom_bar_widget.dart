import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/normal_button.dart';

class FilterBottomBarWidget extends StatelessWidget {
  const FilterBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AutoSizeText(
            'Reset All',
            style: TextStyle(color: ThemeUtils.colorPurple, fontSize: 16),
          ),
          NormalButton(
            height: 50,
            width: Get.context!.width * 0.35,
            text: 'Save',
            backgroundColor: ThemeUtils.colorPurple,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
