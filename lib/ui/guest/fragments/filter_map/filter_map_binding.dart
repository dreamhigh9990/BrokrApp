import 'package:brokr/ui/guest/fragments/filter_map/fliter_map_controller.dart';
import 'package:get/get.dart';

class FilterMapBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FilterMapController>(() => FilterMapController());
  }
}
