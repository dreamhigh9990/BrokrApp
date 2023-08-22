import 'dart:async';
import 'dart:math';
import 'package:brokr/utils/theme_utils.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../guest_home_controller.dart';

class MapFragment extends StatefulWidget {
  const MapFragment({
    super.key,
  });

  @override
  State createState() => MapExploreFragment();
}

class MapExploreFragment extends State<MapFragment> {
  final GuestHomeController controller = Get.find();
  final Completer<GoogleMapController> googleMapController = Completer();
  List<MarkerData> localMarkers = [];
  late CameraPosition _initialPosition;
  final List<LatLng> _points = [];
  Set<Marker>? markersCopy;
  bool firstLoading = false;

  List<LatLng> _getRandomPoints(LatLng center, int radius, int totalPoints) {
    final List<LatLng> points = [];
    final Random random = Random();
    final double radiusInDegrees = radius / 111000;
    for (int i = 0; i < totalPoints; i++) {
      final double u = random.nextDouble();
      final double v = random.nextDouble();
      final double w = radiusInDegrees * sqrt(u);
      final double t = 2 * pi * v;
      final double x = w * cos(t);
      final double y = w * sin(t);
      final double newX = x / cos(center.latitude);
      final double foundLongitude = newX + center.longitude;
      final double foundLatitude = y + center.latitude;
      points.add(LatLng(foundLatitude, foundLongitude));
    }
    return points;
  }

  Widget markerWidget(String text, bool isTapped) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(
          color: isTapped ? Colors.blue : ThemeUtils.colorPurple,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: isTapped ? ThemeUtils.colorPurple : Colors.white,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isTapped ? Colors.white : ThemeUtils.colorPurple,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void initState() {
    init();

    super.initState();
  }

  Future init() async {
    print("EJECUTANDO INIT");
    //await controller.getLocation();

    _initialPosition = CameraPosition(
      target: LatLng(controller.currentPosition!.latitude,
          controller.currentPosition!.longitude),
      zoom: 10,
    );
    _points.addAll(_getRandomPoints(_initialPosition.target, 100000, 100));
    for (int i = 0; i < _points.length; i++) {
      localMarkers.add(MarkerData(
          marker: Marker(
            onTap: () {
              onMarkerTapped(i);
            },
            markerId: MarkerId(i.toString()),
            position: _points[i],
          ),
          child: markerWidget('\$${i + 100}', false)));
    }

    controller.updateWidgetGlobal("state_map");
  }

  void onMarkerTapped(int markerId) {
    changeTabButton(markerId, true);
    if (controller.itemSelected != null) {
      int markerOldId = int.parse(controller.itemSelected!.id.toString());
      changeTabButton(markerOldId, false);
      if (markerId == markerOldId && controller.itemSelected != null) {
        controller.itemSelected = null;
        setState(() {});
        controller.updateWidgetGlobal("item_select");
        return;
      } else if (markerId == markerOldId && controller.itemSelected == null) {
        changeTabButton(markerId, true);
      }
    }

    setState(() {});
    controller.onMarkerTapped(markerId);
  }

  void changeTabButton(int mark, bool value) {
    localMarkers[mark] = MarkerData(
        marker: Marker(
          onTap: () {
            onMarkerTapped(mark);
          },
          markerId: MarkerId(mark.toString()),
          position: _points[mark],
        ),
        child: markerWidget('\$${mark + 100}', value));
  }

  @override
  Widget build(BuildContext context) {
    print("EJECUTANDO REFRESH DE MAP");
    return GetBuilder<GuestHomeController>(
        id: "state_map",
        builder: (__) => controller.currentPosition == null
            ? const Center(child: CircularProgressIndicator())
            : CustomGoogleMapMarkerBuilder(
                customMarkers: localMarkers,
                builder: (BuildContext context, Set<Marker>? markers) {
                  if (markers != null) {
                    markersCopy = markers;
                  }

                  firstLoading = true;
                  return canvasMap(markers);
                }));
  }

  Widget canvasMap(Set<Marker>? markers) {
    if (firstLoading == false || markersCopy == null)  {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GoogleMap(
      zoomControlsEnabled: false,
      myLocationEnabled: false,
      mapType: MapType.normal,
      initialCameraPosition: _initialPosition,
      onMapCreated: (GoogleMapController myController) {
        if (!googleMapController.isCompleted) {
          googleMapController.complete(myController);
        }
        controller.mapController = myController;

        myController.setMapStyle(ThemeUtils().styleMap);
      },
      markers: markers ?? markersCopy!,
    );
  }
}

class CustomMarkerData {
  final Marker marker;
  final Widget child;
  bool pressed = false;

  CustomMarkerData({
    required this.marker,
    required this.child,
    this.pressed = false,
  });
}
