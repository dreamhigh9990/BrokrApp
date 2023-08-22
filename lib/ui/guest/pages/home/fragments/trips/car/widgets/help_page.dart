import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../../controllers/chat_controller.dart';
import '../../../../../../../../utils/theme_utils.dart';
import '../../../../../../../widgets/normal_button.dart';
import '../../../chat/chat_room_fragment.dart';

class HelpPage extends StatelessWidget {
     static ChatController controller = Get.put(ChatController());

  var args = controller.chatrooms[0];
  var id = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange,
      padding: ThemeUtils.paddingScaffoldx05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: Get.context!.height * 0.05,
          ),
          SvgPicture.asset(
            "assets/help/help.svg",
            height: Get.context!.height * 0.15,
          ),
          Text(
            "Need more help?",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          const Text(
              "Tell us about your issue and we'll connect you to an agent. "),
          NormalButton(
            colorBorder: Colors.black,
            colorText: Colors.black,
            backgroundColor: Colors.white,
            text: "Email",
            onTap: () {},
            cornersRadius: 8,
          ),
          NormalButton(
            backgroundColor: ThemeUtils.colorPurple,
            text: "Live chat",
            onTap: () {
                  Get.toNamed(ChatRoomFragment.name,
                        arguments: controller.chatrooms[0]);
            },
            cornersRadius: 8,
          ),
          SizedBox(
            height: Get.context!.height * 0.10,
          )
        ],
      ),
    );
  }
}
