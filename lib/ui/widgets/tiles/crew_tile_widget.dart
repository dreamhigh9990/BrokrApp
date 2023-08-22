import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/ui/commons/pages/message_confirmd_page.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/host_detail_widget.dart';
import 'package:brokr/ui/widgets/stars_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';

class CrewTileWidget extends StatelessWidget {
  final CrewMember crew;

  final double imageSide = 50.0;

  const CrewTileWidget({
    super.key,
    required this.crew,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(HostDetailWidget());
      },
      child: Container(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: Get.height * .04,
                backgroundImage: Image.network(
                  "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  fit: BoxFit.contain,
                ).image,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: CircleAvatar(
                    radius: Get.height * .015,
                    backgroundColor: ThemeUtils.colorPurple,
                    child: SvgPicture.asset("assets/icons/super_host_icon.svg",
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Aly",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: ThemeUtils.interRegular,
                    ),
                  ),
                  StarsWidget(
                    rating: crew.rating,
                    size: 12,
                  ),
                  Text(
                    "50 Trip`s | Joined Apr 2020",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 9.0,
                      fontFamily: ThemeUtils.interRegular,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.to(const MessageConfirmedPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: ThemeUtils.colorPurple,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  height: 50,
                  width: Get.context!.width * 0.38,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/icons/message-typing.svg"),
                        Text(
                          "Message to Host",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: ThemeUtils.interRegular,
                          ),
                        ),
                      ]),
                ),
              ),
            ]),
      ),
    );
  }
}
