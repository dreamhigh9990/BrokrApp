import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

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
    return AppBar(
      title: AutoSizeText(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 5,
      iconTheme: const IconThemeData(color: Colors.black),
      leading: showLeading!
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            )
          : Container(),
    );
  }
}
