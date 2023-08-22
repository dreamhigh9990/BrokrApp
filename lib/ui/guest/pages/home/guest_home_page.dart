// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/bottom_bar_widget.dart';
import 'guest_home_controller.dart';

class GuestHomePage extends GetView<GuestHomeController> {
  static String name = '/guest-home-page';
  const GuestHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GuestHomeController>(
          id: "guest_home_page", builder: (__) => controller.buildContent()),
  /*     bottomNavigationBar: GetBuilder<GuestHomeController>(
        id: 'bottom_bar',
        builder: (controller) => Offstage(
            offstage: !controller.showBottombar,
            child: BottomBarWidget(
              labels: controller.labelFragments,
              iconsPath: controller.iconFragments,
              index: controller.index,
              countNotifications: controller.countNewNotifications,
              onTabItemSelected: (int value) {
                controller.updatePage(value);
              },
            )),
      
      ), */
    );
  }
}
