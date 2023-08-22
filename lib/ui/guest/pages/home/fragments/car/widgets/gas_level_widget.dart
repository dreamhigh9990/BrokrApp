import 'dart:io';

import 'package:brokr/ui/guest/pages/home/fragments/car/widgets/position_camera_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../car_camera_controller.dart';

class GasLevelWidget extends StatelessWidget {
  final CarCameraController controller = Get.find();
  GasLevelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blue,
      child: Stack(
        //  fit: StackFit.expand,
        children: [
          Positioned.fill(
              child: SvgPicture.asset("assets/aside/gas_widget.svg")),
          PositionCameraWidget(
            presesd: () async {
              var xFile = await controller.controllerGlobal
                  .addImageCamera(Get.context!);
              if (xFile != null) {
                controller.files[controller.index].add(File(xFile.path));
                controller.updateGlobal(widget: "aside");
              }
            },
            bottom: 10,
            right: null,
            top: null,
            left: Get.context!.width * 0.25,
          ),
        ],
      ),
    );
  }
}
