
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../utils/theme_utils.dart';
import '../../../widgets/normal_button.dart';
import '../home/guest_home_controller.dart';

class AccesoGpsPage extends StatefulWidget {
  const AccesoGpsPage({super.key});

  @override
  _AccesoGpsPageState createState() => _AccesoGpsPageState();
}

class _AccesoGpsPageState extends State<AccesoGpsPage>
    with WidgetsBindingObserver {
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
      if (await Permission.location.isGranted) {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        guestHomeController.currentPosition = position;

        guestHomeController.isLocationFetched = true;
        guestHomeController.updateWidgetGlobal("update_permission");
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           SvgPicture.asset("assets/icons/icon_location.svg",width: Get.context!.width*0.45),
           const SizedBox(height: 10.0,),
            Text(
              "Allow your location",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:  EdgeInsets.only(left: Get.context!.width*0.22,right: Get.context!.width*0.22),
              child: Text(
                "We will need your location to give you better experience.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal,),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            NormalButton(
              textSize: 12.sp,
              width: Get.context!.width * 0.80,
              backgroundColor: ThemeUtils.colorPurple,
              text: 'Yes, allow location',
              onTap: () async {
                final status = await Geolocator.requestPermission();
                accesoGPS(status);
              },
              cornersRadius: 8,
            ),
          ],
        ),
      ),
    );
  }

  void accesoGPS(LocationPermission status) async {
    print(status);
    switch (status) {
      case LocationPermission.always:
      case LocationPermission.whileInUse:
        {
          guestHomeController.isLocationFetched = true;
          Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
          );
          guestHomeController.currentPosition = position;

          guestHomeController.updateWidgetGlobal("update_permission");
          Get.back();
          break;
        }

      case LocationPermission.denied:
      case LocationPermission.unableToDetermine:
      case LocationPermission.deniedForever:
        {
          if (GetPlatform.isAndroid) {
            openAppSettings();
          } else {
            print('yes');
            await Geolocator.openAppSettings();
          }

          break;
        }

        break;
    }
  }
}
