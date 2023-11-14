import 'dart:async';

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../guest_home_controller.dart';

class MapExploreFragment extends StatefulWidget {
  const MapExploreFragment({
    super.key,
  });

  @override
  State createState() => _MapExploreFragment();
}

class _MapExploreFragment extends State<MapExploreFragment> {
  final GuestHomeController controller = Get.find();
  final Completer<GoogleMapController> googleMapController = Completer();
  final List<MarkerData> _markers = [];
  late CameraPosition _initialPosition;
  final List<LatLng> _points = [];

  //Function to get 100 points random in miami florida
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

  _customMarker3(String text) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        /*    boxShadow: const[
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.251), 
        blurRadius: 10.0, 
        offset: Offset(0, 1),
      ),
    ], */
        border: Border.all(
          color: ThemeUtils.colorPurple,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      child: Center(
          child: AutoSizeText(
        text,
        style: TextStyle(
          color: ThemeUtils.colorPurple,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      )),
    );
  }

  @override
  void initState() {
    _initialPosition = const CameraPosition(
      target: LatLng(27.670283, -81.357442),
      zoom: 10,
    );
    _points.addAll(_getRandomPoints(_initialPosition.target, 100000, 100));
    for (int i = 0; i < _points.length; i++) {
      _markers.add(MarkerData(
          marker: Marker(
            onTap: () => onMarkerTapped(i),
            markerId: MarkerId(i.toString()),
            position: _points[i],
          ),
          child: _customMarker3('\$${i + 100}')));
    }
    super.initState();
  }
  void onMarkerTapped(int markerId) {
    // Aquí puedes realizar acciones adicionales al tocar un marcador
    print('Marcador tocado: $markerId');

    controller.onMarkerTapped(markerId);
  }

/*   Future checkMap() async {

    await controller.getCurrentLocation();
    
    _initialPosition =  CameraPosition(
      target: LatLng(controller.currentPosition!.latitude, controller.currentPosition!.longitude),
      zoom: 10,
    );
    _points.addAll(_getRandomPoints(_initialPosition.target, 100000, 100));
    for (int i = 0; i < _points.length; i++) {
      _markers.add(MarkerData(
          marker: Marker(
            onTap: () => onMarkerTapped(i),
            markerId: MarkerId(i.toString()),
            position: _points[i],
          ),
          child: _customMarker3('\$${i + 100}')));
    }
  }
 */
  @override
  Widget build(BuildContext context) {
    return CustomGoogleMapMarkerBuilder(
          customMarkers: _markers,
          builder: (BuildContext context, Set<Marker>? markers) {
         

            if (markers == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _initialPosition,
              onMapCreated: (GoogleMapController myController) {
                if (!googleMapController.isCompleted) {
                  googleMapController.complete(myController);
                }
                controller.mapController = myController;
                myController.setMapStyle(ThemeUtils().styleMap);
              },
              markers: markers,
            );
          },
        );
  }
}
