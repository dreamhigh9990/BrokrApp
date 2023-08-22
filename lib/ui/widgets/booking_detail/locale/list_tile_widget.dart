import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' as sp;

import '../../../../utils/theme_utils.dart';
import '../../text_align_left_widget.dart';

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
        leading: Container(
               height: 32.5,
        width:32.5,
          child: SvgPicture.asset(assets, width: width)),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            fontFamily: "Inter-Regular",
          ),
        ),
        subtitle: AutoSizeText(subtitle,
            style: const TextStyle(
              fontSize: 11,
              fontFamily: "Inter-Regular",
            )),
        trailing: MaterialButton(
            elevation: 0,
            minWidth: Get.context!.width * 0.30,
            shape: const StadiumBorder(),
            onPressed: () {
              function();
            },
            color: ThemeUtils.dropDownButtonColor,
            child: Text(
              button,
              style: TextStyle(
                fontSize: 12.sp,
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
  Function? functionOntap;
  LisTileWidgetNoTrailing({
    super.key,
    this.button = "Upload",
    required this.title,
    required this.subtitle,
    required this.assets,
    this.width = 32.5,

    this.functionOntap ,
  });
//See cancellation policy
  @override
  Widget build(BuildContext context) {
    return ListTile(

      onTap: (){
          functionOntap!();
      },
      contentPadding: const EdgeInsets.all(0.0),
      minVerticalPadding: 0.0,
      minLeadingWidth: 0.0,
      leading: Container(
        height: 32.5,
        width:32.5,
        child: SvgPicture.asset(assets, width: width)),
      title: AutoSizeText(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          fontFamily: "Inter-Regular",
        ),
      ),
      subtitle: AutoSizeText(subtitle,
          style: const TextStyle(
            fontSize: 11,
            fontFamily: "Inter-Regular",
          )),
      trailing:  SvgPicture.asset("assets/icons/question.svg",),
    );
  }
}

class ListTileColumnWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String body;
  final String icon;
  final Function pressed ;

  bool? notShowDivider;

  ListTileColumnWidget(
      {Key? key,
      required this.pressed,
      this.notShowDivider = true,
      required this.title,
      required this.subtitle,
      required this.body,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          const SizedBox(
            height: 15.0,
          ),
        if (notShowDivider!) ...{
         
          ThemeUtils.dividerGrey,
        },
        const SizedBox(
            height: 15.0,
          ),
        TextAlignLeft(title: title),
        ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          minLeadingWidth: 0.0,
          leading: Container(
                 height: 32.5,
        width:32.5,
            child: SvgPicture.asset("assets/icons/$icon.svg", width: 32.5)),
          title: Text(
            subtitle,
            style: TextStyle(
              fontSize: 14.sp,
            ),
          ),
          subtitle: AutoSizeText(
            body,
            style: const TextStyle(fontSize: 11),
          ),
          trailing: GestureDetector(
            onTap: (){
              pressed();
            },
            child: SvgPicture.asset("assets/icons/more_info.svg",
                width: 20.0, color: Colors.black),
          ),
          // assets: "assets/icons/age_required.svg",
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
