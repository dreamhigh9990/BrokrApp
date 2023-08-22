// ignore_for_file: equal_elements_in_set

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../text_align_left_widget.dart';
import 'pickup_return_widget.dart';

// ignore: must_be_immutable
class RowButtonWidget extends StatelessWidget {
  bool? isShowChange;
  final String title;
  RowButtonWidget({
    super.key,
    required this.title,
    this.isShowChange = true,
  });

  @override
  Widget build(BuildContext context) {
    if (isShowChange! == false) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MaterialButton(
              padding: const EdgeInsets.all(0.0),
              minWidth: 0,
              onPressed: () {
                Get.to( PickUpReturnWidget());
              },
              child: Row(
                children: [
                  const AutoSizeText(
                    "CHANGE",
                    style: TextStyle(color: Color(0xFF505050), fontSize: 11),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset("assets/icons/change.svg")
                ],
              ))
        ],
      );
    } else {
      return TextAlignLeft(title: title);
    }
    ;
  }
}
