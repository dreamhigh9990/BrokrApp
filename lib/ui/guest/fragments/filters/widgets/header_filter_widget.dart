import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HeaderTitleBar extends StatelessWidget {
  final String title;
  final int size;
  HeaderTitleBar({
    super.key,
    required this.title,
    required this.size,
  });

  final GuestHomeController guestHome = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.context!.height * 0.0001),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    print("exit");
                    guestHome.changeBottombar();

                    Get.back();
                  },
                  child: SvgPicture.asset(
                    "assets/bottombar/close.svg",
                    height: 20.0,
                  ),
                ),
                Row(
                  children: [
                    Text(title,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp)),
                    CircleAvatar(
                      minRadius: 5,
                      maxRadius: 10,
                      backgroundColor: ThemeUtils.colorPurple,
                      child: Text(size.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp,
                          )),
                    ),
                  ],
                ),
                SvgPicture.asset("assets/bottombar/close.svg",
                    color: Colors.transparent),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ThemeUtils.dividerGrey,
           const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
