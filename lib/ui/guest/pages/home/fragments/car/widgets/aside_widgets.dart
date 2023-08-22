import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../car_camera_controller.dart';
import 'button_action_widget.dart';

class AsideWidgets extends StatelessWidget {
  final CarCameraController controller = Get.find();
  AsideWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CarCameraController>(
      id: "aside",
      builder: (__) => Expanded(
          flex: 2,
          child: Container(
            //color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonActionWidget(
                    callback: () {
                      controller.index = 0;
                      controller.updateGlobal(widget: "aside");
                    },
                    index: 0,
                    title: "Exterior",
                    svg: "car_front"),
                ButtonActionWidget(
                    callback: () {
                      controller.index = 1;
                      controller.updateGlobal(widget: "aside");
                    },
                    index: 1,
                    title: "Rins",
                    svg: "wheel"),
                ButtonActionWidget(
                    callback: () {
                      controller.index = 2;
                      controller.updateGlobal(widget: "aside");
                    },
                    index: 2,
                    title: "Interior",
                    svg: "sit"),
                ButtonActionWidget(
                    callback: () {
                      controller.index = 3;
                      controller.updateGlobal(widget: "aside");
                    },
                    index: 3,
                    title: "Mileage",
                    svg: "clock"),
                ButtonActionWidget(
                    callback: () {
                      controller.index = 4;
                      controller.updateGlobal(widget: "aside");
                    },
                    index: 4,
                    title: "Gas level",
                    svg: "gas"),
              ],
            ),
          )),
    );
  }
}
