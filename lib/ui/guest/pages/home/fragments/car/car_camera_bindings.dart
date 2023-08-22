


import 'package:get/get.dart';

import 'car_camera_controller.dart';

class CarCameraBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<CarCameraController>(() => CarCameraController(
    ));
  }
}