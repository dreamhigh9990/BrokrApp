import 'package:get/get.dart';

import 'guest_home_controller.dart';

class GuestHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<GuestHomeController>(GuestHomeController(), permanent: true);
  }
}
