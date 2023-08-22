import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/theme_utils.dart';
import '../../../../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../../../../widgets/appbar_widget.dart';
import '../../../../../../../widgets/bottom_bar_container_full_widget.dart';
import '../../../../guest_home_controller.dart';

class PriceDetailsPage extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  PriceDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(title: "Price details"),
      bottomNavigationBar:
          BottomBarContainerFullWidget(ontap: () {}, title: "Submit request"),
      body: Container(
          height: Get.context!.height,
          width: Get.context!.width,
          padding: ThemeUtils.paddingScaffoldx05,
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: Get.context!.height * 0.03,
              ),
              container("\$1,000.00 x 1 extra days", "\$1,000.00"),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              container("Brokr fee", "\$110.00"),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              container("Taxes", "\$777.00"),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              container("MILES INCLUDED . . . . . . . . . . . . . . . . . . . . . . .", "100 mi"),
              SizedBox(
                height: Get.context!.height * 0.05,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Total  (USD)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(
                      "\$1,187.70",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              GestureDetector(
                onTap: () async {
                  var response =
                      await GuestBottomSheests.buildshowGeneralDialog(
                          context: context,
                          widgetChild: guestHomeController.bottomSheests
                              .pricebreakdown(
                                container: container,
                              ),
                          height: Get.context!.height * 0.97);
                },
                child: const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Price breakdown",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.03,
              ),
              ThemeUtils.dividerGrey,
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              const Text(
                  "Once the Host confirms your extension request, the amount of (\$1,187.70) will be charged to your credit card ending in 456 no charges will me made until then"),
              SizedBox(
                height: Get.context!.height * 0.25,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: 'By selecting the button below, I agree to the ',

                  style: TextStyle(color: Colors.black, fontSize: 12.sp),

                  children: [
                    TextSpan(
                        text:
                            "Host's Vehicle Rules, Brokr's Rebooking and Refund Policy",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    TextSpan(
                        text: " and that Brokr can",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    TextSpan(
                        text: " charge my payment method",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Colors.black)),
                    TextSpan(
                        text:
                            " if I’m responsible for damage. I agree to pay the total amount shown if the Host accepts my booking request",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: Colors.black)),
                  ],

                  //
                ),
              ),
            ]),
          )),
    );
  }

  Widget container(String title, String subtitle,{
    double fontSize = 12,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Container(
      width: Get.context!.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: fontWeight,
                fontSize: fontSize.sp,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
          ),
          Expanded(
            child: Text(
              subtitle,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: fontWeight,
                   fontSize: fontSize.sp,
                  color: const Color.fromARGB(255, 10, 10, 10)),
            ),
          )
        ],
      ),
    );
  }
}
