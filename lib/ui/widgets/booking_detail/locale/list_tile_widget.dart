import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';

class LisTileWidget extends StatelessWidget {
  final String title;
  final String assets;
  final String subtitle;
  double? width;
  String button;
  final Function function;

  LisTileWidget({
    super.key,
    this.button = "Upload",
    required this.title,
    required this.subtitle,
    required this.assets,
    this.width = 32.5,
    required this.function,
  });
//See cancellation policy
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(0.0),
        minVerticalPadding: 0.0,
        minLeadingWidth: 0.0,
        leading: SvgPicture.asset(assets, width: width),
        title: AutoSizeText(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Inter-Regular",),
        ),
        subtitle: AutoSizeText(subtitle, style: const TextStyle(fontSize: 11, fontFamily: "Inter-Regular",)),
        trailing: MaterialButton(
            elevation: 0,
            minWidth: Get.context!.width * 0.30,
            shape: const StadiumBorder(),
            onPressed: () {

              function();
            },
            color: ThemeUtils.dropDownButtonColor,
            child: AutoSizeText(
              button,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: "Inter-Regular",
              ),
            )));
  }
}

class LisTileWidgetNoTrailing extends StatelessWidget {
  final String title;
  final String assets;
  final String subtitle;
  double? width;
  String button;

  LisTileWidgetNoTrailing({
    super.key,
    this.button = "Upload",
    required this.title,
    required this.subtitle,
    required this.assets,
    this.width = 32.5,
  });
//See cancellation policy
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      minVerticalPadding: 0.0,
      minLeadingWidth: 0.0,
      leading: SvgPicture.asset(assets, width: width),
      title: AutoSizeText(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Inter-Regular",),
      ),
      subtitle: AutoSizeText(subtitle, style: const TextStyle(fontSize: 11, fontFamily: "Inter-Regular",)),
      trailing: const MaterialButton(onPressed: null),
    );
  }
}
