import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        ListTile(
          onTap: (){
            
          },
          contentPadding: EdgeInsets.only(
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05,
          ),
          leading: CircleAvatar(
            backgroundColor: ThemeUtils.colorPurple,
            child:  SvgPicture.asset("assets/icons/alert.svg", color: Colors.white),
          ),
          title: Text(
              "Your request was accepted correctly, you can check in your booking section.",
              style: TextStyle(fontSize: 12.sp)),
          subtitle: Align(
            alignment: Alignment.centerRight,
            child: Text("11:09 PM",
                style: TextStyle(fontSize: 12.sp, color: ThemeUtils.colorPurple)),
          ),
        ),
        /*  Container(
         
              child: Padding(
                padding: EdgeInsets.only(
                  left: Get.context!.width * 0.05,
                  right: Get.context!.width * 0.05,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                
                  SizedBox(
                    width: Get.context!.width * 0.035,
                  ),
               Expanded(
                 child: 
               ),
                  Container(
                 
                      color: Colors.blue,
                      child: const Text("11:09 PM")),
                ]),
              ),
            ), */
        ThemeUtils.dividerGrey,
      ],
    ));
  }
}
