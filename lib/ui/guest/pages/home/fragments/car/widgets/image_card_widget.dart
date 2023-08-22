import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../utils/theme_utils.dart';

class ImageCardWidget extends StatelessWidget {
  final Function remove;
  final File file;
  const ImageCardWidget({super.key, required this.remove, required this.file});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.0825,
      width: Get.context!.width * 0.185,
      margin: const EdgeInsets.only(right: 10.0, left: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.35),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Image.file(
            file,
            height: Get.context!.height * 0.0825,
            width: Get.context!.width * 0.185,
            fit: BoxFit.cover,
          ),
          Transform.translate(
            offset: const Offset(60, -12.5),
            child: GestureDetector(
              onTap: () {
                remove();
              },
              child: CircleAvatar(
                maxRadius: 12,
                minRadius: 12,
                backgroundColor: ThemeUtils.colorPurple,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
