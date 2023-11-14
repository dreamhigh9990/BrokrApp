import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show CameraUpdate;

import '../../../../../utils/theme_utils.dart';
import '../guest_home_controller.dart';

class FloatingActionButtonCustom extends StatelessWidget {
  final GuestHomeController controller = Get.find();
  final Function buildFilters;

  FloatingActionButtonCustom({super.key, required this.buildFilters});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 50,
        width: 200,
        margin: EdgeInsets.only(bottom: controller.showMap.value ? Get.context!.height * 0.2250 : 16),
        decoration: BoxDecoration(
          color: ThemeUtils.colorPurple,
          borderRadius: const BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.showMap.value = !controller.showMap.value;

                  
                  controller.changeBottombar();
                  controller.updateScreen();
                  if (controller.showMap.value == false) {
                    controller.mapController!
                        .animateCamera(CameraUpdate.zoomIn());
                  } else {
                    controller.mapController!
                        .animateCamera(CameraUpdate.zoomOut());
                  }

                  controller.onMarkerTapped(null);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      controller.showMap.value
                          ? 'assets/icons/list_icon.svg'
                          : 'assets/icons/map_icon.svg',
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    AutoSizeText(
                      controller.showMap.value ? 'Listings' : 'Map',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: 2.0,
              color: Colors.white,
            ),
            Expanded(
              child: InkWell(
                onTap: () => buildFilters(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/filter_icon.svg',
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    AutoSizeText(
                      'Filter',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
