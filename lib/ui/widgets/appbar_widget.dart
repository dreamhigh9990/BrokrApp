import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final bool? showLeading;

  const CustomBar({
    super.key,
    required this.title,
    this.showLeading = true,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          leading: showLeading!
              ? IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                )
              : Container(),
        ),
        ThemeUtils.dividerGrey,
      ],
    );
  }
}
