import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class InsuranceInformationWidget extends StatelessWidget {
  const InsuranceInformationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Insurance Information",
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
      body: ListView(
        padding: EdgeInsets.only(
            top: Get.context!.height * 0.035,
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05),
        shrinkWrap: true,
        children: [
          customtextfield("Insured first name"),
          customtextfield("Insured last name"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customtextfield("Birthday", width: Get.context!.width * 0.40),
              customtextfield("Country/Region",
                  width: Get.context!.width * 0.40),
            ],
          ),
          customtextfield("Address"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customtextfield("City", width: Get.context!.width * 0.28),
              customtextfield("State", width: Get.context!.width * 0.28),
              customtextfield("Zip Code", width: Get.context!.width * 0.28),
            ],
          ),
          customtextfield("Phone Number"),
          customtextfield("Email"),
        ],
      ),
    );
  }

  Widget customtextfield(String text, {double? width}) {
    width ??= Get.context!.width;
    return Container(
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      height: 60,
      width: width,
      child: InputDecorator(
        decoration: ThemeUtils.inputDecoration(
            fontWeight: FontWeight.normal,
            isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
            labelText: text),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none, // Eliminar el borde del TextField
          ),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
