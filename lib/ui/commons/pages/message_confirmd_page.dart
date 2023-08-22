// # code .. .

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/ui/widgets/text_align_left_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageConfirmedPage extends StatelessWidget {
  const MessageConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AutoSizeText(
          "Message the Host",
          style: TextStyle(
              fontFamily: ThemeUtils.interRegular,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: Get.context!.height * 0.035,
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TextAlignLeft(title: "Listing", fontsize: 15),
            Center(
              child: AutoSizeText(
                "Item Selected Title",
                style: TextStyle(color: ThemeUtils.titleFilter),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextAlignLeft(title: "Dates", fontsize: 15),
            Center(
              child: AutoSizeText(
                "Sat, Oct 08, 10:30 AM",
                style: TextStyle(
                    fontFamily: ThemeUtils.interRegular,
                    color: ThemeUtils.titleFilter),
              ),
            ),
            Center(
              child: AutoSizeText(
                "Sat, Oct 08, 10:30 AM",
                style: TextStyle(
                    fontFamily: ThemeUtils.interRegular,
                    color: ThemeUtils.titleFilter),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextAlignLeft(title: "Pickup & Return", fontsize: 15),
            const SizedBox(
              height: 5.0,
            ),
            Center(
              child: AutoSizeText(
                "New Jersy, Bloomfield,  72 Avenue 8731",
                style: TextStyle(
                    fontFamily: ThemeUtils.interRegular,
                    color: ThemeUtils.titleFilter),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            InputDecorator(
              decoration: ThemeUtils.inputDecoration(
                  fontWeight: FontWeight.normal,
                  isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  labelText: "Message"),
              child: const TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  border: InputBorder.none, // Eliminar el borde del TextField
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            AutoSizeText(
              "For your payment protection, it is recommended to always communicate and make payments through the Brokr platform.",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: ThemeUtils.interRegular),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
            top: Get.context!.height * 0.035,
            bottom: Get.context!.height * 0.035,
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05),
        child: NormalButton(
            text: "Send Message",
            onTap: () {},
            backgroundColor: ThemeUtils.colorPurple),
      ),
    );
  }
}
