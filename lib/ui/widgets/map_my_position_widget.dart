import 'dart:async';

import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/theme_utils.dart';

class MapSampleWidget extends StatelessWidget {
  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  final GuestHomeController guestController = Get.find();

  MapSampleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.context!.height * 0.25,
        width: Get.context!.width,
        margin: const EdgeInsets.only(bottom: 10.0),
        child: GoogleMap(
          myLocationEnabled: true,
          buildingsEnabled: false,
          compassEnabled: false,
          indoorViewEnabled: false,
          liteModeEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: false,
          zoomGesturesEnabled: false,
          trafficEnabled: false,
          tiltGesturesEnabled: false,
          zoomControlsEnabled: false,
          scrollGesturesEnabled: false,
          rotateGesturesEnabled: false,
          mapType: MapType.normal,
          initialCameraPosition: const CameraPosition(
            target: LatLng(
          27.670283, -81.357442
            ),
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController myController) {
            if (!googleMapController.isCompleted) {
              googleMapController.complete(myController);
            }

            myController.setMapStyle(ThemeUtils().styleMap);
          },
        ));
  }
}
