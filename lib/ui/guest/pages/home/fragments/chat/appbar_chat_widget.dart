import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base_app_bar_widget.dart';
import 'default_text_widget.dart';


class ChatAppBar extends BaseAppBar {
  ChatAppBar(
      {super.key,
      required String imageCode,
      required String userName,
      required String userEmail})
      : super(
            leading: IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.arrow_back_ios, size: Get.height * .025,color: Colors.black,)),
            title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.transparent,
                      foregroundColor: Colors.transparent,
                      radius: Get.height * .10 * .35,
                      foregroundImage: Image.network(imageCode,
                              alignment: Alignment.center, fit: BoxFit.cover)
                          .image),
                SizedBox(width: Get.width * .025),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultText(
                              maxLines: 1,
                              align: TextAlign.left,
                              text: userName,
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,),
                              const SizedBox(height: 5.0,),
                          DefaultText(
                              maxLines: 1,
                              align: TextAlign.right,
                              text: userEmail,
                              color: const Color(0xFF536678),
                              fontSize: 12)
                        ]),
                  )
                ]));
}
