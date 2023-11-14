import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HeaderTitleBar extends StatelessWidget {
  final String title;
  HeaderTitleBar({
    super.key,
    required this.title,
  });

  final GuestHomeController guestHome = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Get.context!.height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {

                  print("exit");
                 guestHome.changeBottombar();

                  Get.back();
                },
                child: SvgPicture.asset("assets/bottombar/close.svg"),
              ),
              AutoSizeText(title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  )),
              SvgPicture.asset("assets/bottombar/close.svg",
                  color: Colors.transparent),
            ],
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
