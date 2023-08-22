import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../utils/calendar_utils.dart';
import '../../text_align_left_widget.dart';

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
          TextAlignLeft(title: "Insurance info"),
          const SizedBox(
            height: 10.0,
          ),
          customtextfield("Auto insurance company"),
          customtextfield("Insurance policy number"),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customtextfield("Effective date",
                  hintText: "MM/DD/YY", width: Get.context!.width * 0.40),
              customtextfield("Expiration date",
                  hintText: "MM/DD/YY", width: Get.context!.width * 0.40),
            ],
          ),
          customtextfield("Insured name"),
          customtextfield("Insured last name"),
          customtextfield("Insured phone number"),
          TextAlignLeft(title: "Vehicle info"),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              customtextfield("Insured vehicle year",
                  width: Get.context!.width * 0.38),
              customtextfield("Make", width: Get.context!.width * 0.24),
              customtextfield("Model", width: Get.context!.width * 0.24),
            ],
          ),
          customtextfield("Insured vehicle VIN number"),
        ],
      ),
    );
  }

  Widget customtextfield(String text, {double? width, String? hintText = ""}) {
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
        child: TextField(
             inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          DateTextFormatter(),
        ],
        keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none, // Eliminar el borde del TextField
          ),
          textInputAction: TextInputAction.done,
        ),
      ),
    );
  }
}
