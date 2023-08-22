import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/normal_button.dart';

class FilterBottomBarWidget extends StatelessWidget {
  final String title;
  String? firstButton;
  final Function callbackReset;
  final Function save;
   FilterBottomBarWidget(

      {super.key, 
          this.firstButton ="Reset all",
      required this.callbackReset, required this.save, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.10,
      //color: Colors.green,
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    callbackReset();
                  },
                  child: AutoSizeText(
                    firstButton!,
                    style:
                        TextStyle(color: ThemeUtils.colorPurple, fontSize: 16),
                  ),
                ),
                NormalButton(
                  height: 50,
                  width: Get.context!.width * 0.35,
                  text: title,
                  backgroundColor: ThemeUtils.colorPurple,
                  onTap: () {
                    save();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
