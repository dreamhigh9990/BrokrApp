import 'package:brokr/ui/commons/pages/message_confirmd_page.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/car_camera_page.dart';
import 'package:brokr/ui/guest/pages/home/fragments/trips/car/widgets/receipt_page.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/about_the_host_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/theme_utils.dart';
import '../../../../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../../../../widgets/booking_detail/locale/host_detail_widget.dart';
import '../../../../../../../widgets/normal_button.dart';

class DetailsLocalePage extends StatelessWidget {
   DetailsLocalePage({super.key});


  final GuestHomeController guestHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ThemeUtils.paddingScaffoldx05,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: Get.context!.height * 0.025),
          Text(
            "Trip info",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          Container(
            //color: Colors.blue,
            height: Get.context!.height * 0.10,
            width: Get.context!.width,

            child: Row(children: [
              textTrip("Start"),
              Container(height: 20.0, width: 2.5, color: Colors.grey),
              textTrip("End"),
            ]),
          ),
          SizedBox(height: Get.context!.height * 0.01),
          ThemeUtils.dividerGrey,
          SizedBox(height: Get.context!.height * 0.025),
          Text(
            "Pickup & Return",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: Get.context!.height * 0.015),
          Center(
            child: Text(
              "Miami International Airport",
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
            ),
          ),
          SizedBox(height: Get.context!.height * 0.025),
          ThemeUtils.dividerGrey,
          SizedBox(height: Get.context!.height * 0.025),
          NormalButton(
            textSize: 12.sp,
            colorBorder: Colors.black,
            colorText: Colors.black,
            backgroundColor: Colors.white,
            text: "Change Trip",
            onTap: () async {

             var response = await GuestBottomSheests.buildshowGeneralDialog(
          context: context,
          widgetChild: guestHomeController.bottomSheests.changeTrip(
            guestHomeController,
          
            getBackFunction: () {
              
            },
          ),
          height: Get.context!.height * 0.97);

                  
            },
            cornersRadius: 8,
          ),
          SizedBox(height: Get.context!.height * 0.025),
          NormalButton(
            textSize: 12.sp,
            colorBorder: Colors.black,
            colorText: Colors.black,
            backgroundColor: Colors.white,
            text: "Cancel Trip",
            onTap: () async {
               var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild:
                      guestHomeController.bottomSheests.cancelTrip(),
                  height: Get.context!.height * 0.65);
            },
            cornersRadius: 8,
          ),
          SizedBox(height: Get.context!.height * 0.025),
          Center(
            child: Text(
              "Inspect & document the car before your trip starts",
              style: TextStyle(fontSize: 12.sp),
            ),
          ),
          SizedBox(height: Get.context!.height * 0.025),
          NormalButton(
            textSize: 12.sp,
            backgroundColor: ThemeUtils.colorPurple,
            text: "Get started",
            onTap: () {},
            cornersRadius: 8,
          ),
          SizedBox(height: Get.context!.height * 0.025),
          ThemeUtils.dividerGrey,
          SizedBox(height: Get.context!.height * 0.025),
          singleListTile("Car photos", "car_photos", function: () async {
            Get.toNamed(CarCameraPage.id);
          }),
          singleListTile("Your receipt", "receipt", function: () {
            Get.to(ReceiptPage());
          }),
          twoListTile("Miles inclued", "miles"),
          singleListTile("About the car", "about_the_car", function: () {}),
          singleListTile("About the host", "about_the_host", function: () {
            Get.to(HostDetailWidget());
          }),
        ]),
      ),
    );
  }

  Widget textTrip(String title) {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: TextStyle(
              color: const Color(0xFF505050),
              fontSize: 14.sp,
              fontWeight: FontWeight.bold),
          children: <TextSpan>[
            TextSpan(
              text: '\n\nSat, Oct 08, 10:30 AM',
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    ));
  }

  Widget twoListTile(String title, String svg) {
    return ListTile(
      minLeadingWidth: 0.0,
      contentPadding: const EdgeInsets.all(0.0),
      minVerticalPadding: 0.0,
      trailing: Text("300 mi"),
      title: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          text: title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.normal),
          children: <TextSpan>[
            TextSpan(
              text:
                  '\nYou’ll be charged (\$5) for each extra mile over the amount included',
              style: TextStyle(
                  color: Color(0xFF6C6A6A),
                  fontSize: 08.sp,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
      leading: Container(
          height: 30,
          width: 30.0,
          child: SvgPicture.asset("assets/help/$svg.svg", width: 30)),
    );
  }

  Widget singleListTile(String title, String svg,
      {required Function function}) {
    return ListTile(
      onTap: () async {
        function();
      },
      minLeadingWidth: 0.0,
      contentPadding: const EdgeInsets.all(0.0),
      minVerticalPadding: 0.0,
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 12.0.sp,
          color: Colors.black,
        ),
      ),
      leading: Container(
          height: 30,
          width: 30.0,
          child: SvgPicture.asset("assets/help/$svg.svg", width: 30)),
    );
  }
}
