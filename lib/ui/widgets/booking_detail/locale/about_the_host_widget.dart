import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/host_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../utils/theme_utils.dart';
import '../../../commons/pages/message_confirmd_page.dart';
import '../../text_align_left_widget.dart';

class AboutTheHostWidget extends StatelessWidget {
  final CrewMember crew;
  const AboutTheHostWidget({super.key, required this.crew});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /*   const Divider(
          color: Colors.grey,
        ), */
        TextAlignLeft(title: "About the Host"),
        const SizedBox(
          height: 20.0,
        ),
        HostDetailWidget.superHeaderHostDetail(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.39,
                right: Get.context!.width * 0.39),
            firstRadius: Get.height * .06,
            secondRadius: Get.height * .0180),
        const SizedBox(
          height: 10.0,
        ),
        InkWell(
          onTap: () {
            Get.to(const MessageConfirmedPage());
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            height: 50,
            width: Get.context!.width * 0.95,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/message-typing.svg",
                      color: Colors.black, height: 20),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Message to Host",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: ThemeUtils.interRegular,
                    ),
                  ),
                ]),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
