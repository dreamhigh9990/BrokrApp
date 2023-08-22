import 'dart:io';

import 'package:brokr/ui/commons/pages/success_page.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/aside_widgets.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/button_action_widget.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/car_page_one_widget.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/gas_level_widget.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/interior_widget.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/mileage_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../widgets/appbar_widget.dart';
import '../../../../../widgets/bottom_bar_container_full_widget.dart';
import 'car_camera_controller.dart';
import 'widgets/car_page_two_widget.dart';
import 'widgets/image_card_widget.dart';

class CarCameraPage extends GetView<CarCameraController> {
  static String id = "/car_camera_page";
  const CarCameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarCameraController>(
        builder: (__) => Scaffold(
            backgroundColor: Colors.white,
            appBar: const CustomBar(title: "Car photos"),
            body: superBody(),
            bottomNavigationBar: BottomBarContainerFullWidget(
                ontap: () {
                  Get.to(SuccessPage(
                      svg: "confirm",
                      title: "The photos have been successfully saved",
                      subtitle: "",
                      titleButton: "Done"));
                },
                title: "Save")));
  }

  Widget superBody() {
    return Container(
      height: Get.context!.height,
      width: Get.context!.width,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      padding: ThemeUtils.paddingScaffoldx05,
      child: Column(
        children: [
          Text(
            "Please be sure to document the condition of the entire vehicle before and after your trip by taking photos of all sides, including interior, exterior, mileage, rims, or any damage you might see. ",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: Get.context!.height * 0.45,
            width: Get.context!.width,
            child: Row(
              children: [
                Container(
                  // color: Colors.green,
                  width: Get.context!.width * 0.650,
                  child: GetBuilder<CarCameraController>(
                      id: "aside",
                      builder: (__) => PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: controller.pageController,
                            children: [
                              CarPageOne(),
                              CarPageTwo(),
                              InteriorWidget(),
                              MileageWidget(),
                              GasLevelWidget(),
                            ],
                          )),
                ),
                AsideWidgets(),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            "Upload the photos to document your trip (Max 15 photos)",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: SizedBox(
              //color: Colors.red,
              child: Row(
                children: [
                  ButtonActionWidget(
                      callback: () async {
                        var xFile = await controller.controllerGlobal
                            .addImageCamera(Get.context!);
                        if (xFile != null) {
                          controller.files[controller.index]
                              .add(File(xFile.path));
                          controller.updateGlobal(widget: "aside");
                        }
                      },
                      title: "Add photo",
                      svg: "camera",
                      index: null),
                  Expanded(
                    child: GetBuilder<CarCameraController>(
                      id: "aside",
                      builder: (__) => ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.files[controller.index].length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Center(
                                child: ImageCardWidget(
                              remove: () async {
                                controller.files[controller.index]
                                    .removeAt(index);
                                controller.updateGlobal(widget: "aside");
                              },
                              file: controller.files[controller.index][index],
                            ));
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
