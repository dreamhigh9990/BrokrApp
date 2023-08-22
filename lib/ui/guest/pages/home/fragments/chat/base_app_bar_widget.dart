import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  BaseAppBar(
      {super.key,
      required this.leading,
      required this.title,
      this.centerTitle = true,
      this.elevation = 0.0,
      this.backgroundColor = Colors.white});

  @override
  final Size preferredSize = Size.fromHeight(Get.height * .10);

  final Widget leading;
  final Widget title;
  final bool centerTitle;
  final double elevation;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
            elevation: elevation,
            backgroundColor: backgroundColor,
            toolbarHeight: preferredSize.height,
            leadingWidth: preferredSize.height,
            centerTitle: centerTitle,
            leading: leading,
            title: title),
        ThemeUtils.dividerGrey,
      ],
    );
  }
}
