import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';
import 'row_button_widget.dart';

class ColumnHeadersWidget extends StatelessWidget {
  final String title;
  final String svg;
  final String content;
  final bool isShowChange;
  bool? textCenter;
  ColumnHeadersWidget({
    super.key,
    required this.title,
    required this.svg,
    required this.content,
    required this.isShowChange,
    this.textCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: isShowChange == true ? 15.0 : 0,
        ),
        RowButtonWidget(title: title, isShowChange: isShowChange),
        Row(children: [
          SizedBox(
            width: Get.context!.width * 0.25,
            child: SvgPicture.asset("assets/icons/$svg.svg"),
          ),
          if (textCenter == true) ...{
            SizedBox(
              width: Get.context!.width * 0.2,
            ),
            Center(
              child: AutoSizeText(
                content,
                style: const TextStyle(color: Color(0xFF505050)),
              ),
            )
          } else ...{
            Expanded(
              flex: 2,
              child: AutoSizeText(
                content,
                style: const TextStyle(color: Color(0xFF505050)),
              ),
            )
          },
        ]),
        const SizedBox(
          height: 10.0,
        ),
        ThemeUtils.dividerGrey,
        SizedBox(
          height: isShowChange == true ? 5.0 : 0,
        ),
      ],
    );
  }
}
