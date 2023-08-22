import 'package:brokr/ui/guest/pages/config_pages/acceso_gps_page.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  final GuestHomeController guestHomeController = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.isLocationServiceEnabled()) {
        // Get.offNamed(Routes.MAPAPAGE);

             Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      guestHomeController.currentPosition = position;

        guestHomeController.isLocationFetched = true;
        guestHomeController.updateWidgetGlobal("update_permission");
        print("hay permiso");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkGpsLocation(),
      builder: (__, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(snapshot.data),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
            ),
          );
        }
      },
    );
  }

  Future checkGpsLocation() async {
    //permiso gps
    final permiso = await Permission.location.isGranted;
    final gpsActivo = await Geolocator.isLocationServiceEnabled();

    //gps activo

    if (permiso && gpsActivo) {
      print("hay permiso");
      guestHomeController.isLocationFetched = true;

             Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      guestHomeController.currentPosition = position;
      
      guestHomeController.updateWidgetGlobal("update_permission");
    } else if (!permiso) {
      Get.to(const AccesoGpsPage() );
      print("no hay permiso");
      return "Es necesario el permiso de gps";
    } else {
      return "Active el gps";
    }
  }
}
