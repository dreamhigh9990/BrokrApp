import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../widgets/appbar_widget.dart';
import '../../../../../../../widgets/bottom_bar_container_full_widget.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(title: "Receipt"),
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
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Reservation",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Text(
                      "0000001",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: ThemeUtils.colorPurple),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              ThemeUtils.dividerGrey,
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Text(
                "Title Full Listing Card Item",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "TRIP START",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                        color: Color(0xFF666666),
                      ),
                    ),
                    Text(
                      "TRIP END",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Color(0xFF666666)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Sat, Oct 08, 10:30 AM",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Sat, Oct 08, 04:30 PM",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 10, 10, 10)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "PICKUP LOCATION",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                        color: Color(0xFF666666),
                      ),
                    ),
                    Text(
                      "RETURN LOCATION",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Color(0xFF666666)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Miami International Airport",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Miami International Airport",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 10, 10, 10)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              ThemeUtils.dividerGrey,
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "MILES INCLUDED   .   .   .   .   .   .   .   .   .   ",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Color(0xFF666666),
                        ),
                      ),
                    ),
                    Text(
                      "300 mi",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Color(0xFF666666)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Over miles   .   .   .   .   .   .   .   .   .   .   .   .",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Text(
                      "23 mi",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: Color(0xFF666666)),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              ThemeUtils.dividerGrey,
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Text(
                "Price Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "\$1,500.00 x 3 days",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$4,500.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 10, 10, 10)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "brokr fees",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$675.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 10, 10, 10)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Total miles 323",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$115.00",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 10, 10, 10)),
                      ),
                    )
                  ],
                ),
              ),
        
                 SizedBox(
                height: Get.context!.height * 0.015,
              ),
              ThemeUtils.dividerGrey,
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
        
            Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "Total (USD)",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "\$16,605.35",
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: const Color.fromARGB(255, 10, 10, 10)),
                      ),
                    )
                  ],
                ),
              ),
        
        
                 SizedBox(
                height: Get.context!.height * 0.015,
              ),
              ThemeUtils.dividerGrey,
              SizedBox(
                height: Get.context!.height * 0.015,
              ),
        
        
          Text(
                "Payment Details",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              ),
         SizedBox(
                height: Get.context!.height * 0.015,
              ),
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "VISA *********12345",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                        color: const Color(0xFF666666),
                      ),
                    ),
                    Text(
                      "\$6,605.35",
                      textAlign: TextAlign.end,
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
              Container(
                width: Get.context!.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Your host",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14.sp,
                        color: const Color(0xFF666666),
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Hostname lastname",
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: ThemeUtils.colorPurple),
                    ),
                    const Icon(Icons.arrow_forward_ios_outlined)
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
    bottomNavigationBar:
          BottomBarContainerFullWidget(ontap: () {}, title: "Done"),
   
    );
  }
}
