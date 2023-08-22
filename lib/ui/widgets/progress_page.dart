import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '/utils/theme_utils.dart';
import '../../controllers/global_controller.dart';

class ProgressPage extends StatelessWidget {
  final Color? progressColor;

  final ctr = Get.find<GlobalController>();

  ProgressPage({
    Key? key,
    this.progressColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: ctr.showProgress,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
          color: const Color(0x80000000),
          child: SpinKitDoubleBounce(
            color: progressColor ?? ThemeUtils.primaryColor,
            size: 60,
          ),
        ),
      ),
    );
  }
}
