import 'dart:io';

import 'package:brokr/controllers/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarCameraController extends GetxController {
  final PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  final GlobalController controllerGlobal = Get.find();

  List<List<File>> files = [[],[],[],[],[] ];
  int index = 0;

  void updateGlobal({required String widget}) {
    update([widget]);
  }





  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
