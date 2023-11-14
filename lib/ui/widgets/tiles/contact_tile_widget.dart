import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../models/chat_room_model.dart';
import '../../../utils/theme_utils.dart';

class ContactTile extends StatelessWidget {
  final ChatRoomModel chat;

  const ContactTile({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(children: [
        const SizedBox(
          width: 15.0,
        ),
        CircleAvatar(
          backgroundColor: Colors.grey,
          radius: Get.height * .035,
          backgroundImage: Image.network(
            chat.image,
            fit: BoxFit.contain,
          ).image,
          child: Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
              radius: Get.height * .0125,
              backgroundColor: Colors.white,
              child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle)),
            ),
          ),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              chat.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              height: 15,
              width: Get.context!.width * 0.60,
              child: AutoSizeText(
                chat.subtitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 10, color: ThemeUtils.titleFilter),
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "18.31",
              style: TextStyle(fontSize: 12, color: ThemeUtils.titleFilter),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: ThemeUtils.colorPurple, shape: BoxShape.circle),
              height: 20,
              width: 20.0,
              child: const Text(
                "5",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 15.0,
        ),
      ]),

    
    );
  }
}
