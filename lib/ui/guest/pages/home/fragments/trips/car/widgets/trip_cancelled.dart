import 'package:brokr/ui/commons/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../../utils/theme_utils.dart';
import '../../../../../../../widgets/appbar_widget.dart';
import '../../../../../../../widgets/bottom_bar_container_full_widget.dart';

class TripCancelledPage extends StatelessWidget {
  const TripCancelledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomBar(title: "Trip Cancelled"),
        bottomNavigationBar: BottomBarContainerFullWidget(
            ontap: () {
              Get.to(SuccessPage(
                  svg: "confirm",
                  title: "The trip has been canceled",
                  subtitle: "Your refund will be sent as soon as possible.",
                  titleButton: "Done"));
            },
            title: "Yes, cancel"),
        body: Container(
            height: Get.context!.height,
            width: Get.context!.width,
            padding: ThemeUtils.paddingScaffoldx05,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    height: Get.context!.height * 0.05,
                  ),
                  Text("cancellation details"),
                  SizedBox(
                    height: Get.context!.height * 0.01,
                  ),
                  Container(
                    width: Get.context!.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "\$900.00 x 3 days",
                          style: TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14.sp),
                        ),
                        Text(
                          "\$2,700.00",
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14.sp,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: Get.context!.height * 0.015,
                  ),
                  ThemeUtils.dividerGrey,
                  customColumn("Delivery", "\$100.00"),
                  customColumn("Service fee", "\$100.00"),
                  customColumn("Sale Tax", "\$100.00"),
                  customColumn("Total", "\$3,145.80",
                      fontWeight: FontWeight.bold, fontSize: 14.sp),
                  customColumn("Refound Amount", "\$2,000.10",
                      fontWeight: FontWeight.bold, fontSize: 14.sp),
                  SizedBox(
                    height: Get.context!.height * 0.015,
                  ),
                  ListTile(
                    leading: SvgPicture.asset("assets/icons/more_info.svg"),
                    minLeadingWidth: 0.0,
                    minVerticalPadding: 0.0,
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Due to the cancellation policies selected in this item, the refund amount varies according to the same.",
                      style: TextStyle(
                          fontSize: 10.sp, color: const Color(0xFF61646B)),
                    ),
                  )
                ]))));
  }

  Widget customColumn(String title, String subtitle,
      {FontWeight? fontWeight = FontWeight.normal, double fontSize = 14}) {
    return Column(
      children: [
        SizedBox(
          height: Get.context!.height * 0.03,
        ),
        Container(
          width: Get.context!.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp,
                  color: Colors.black,
                ),
              ),
              Text(
                subtitle,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: Get.context!.height * 0.015,
        ),
        ThemeUtils.dividerGrey,
      ],
    );
  }
}
