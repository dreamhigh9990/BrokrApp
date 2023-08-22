import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelationPolicyWidget extends StatelessWidget {
  const CancelationPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0,bottom: 15.0),
      padding: EdgeInsets.all(Get.context!.width * 0.035),
      alignment: Alignment.centerLeft,
      decoration: const BoxDecoration(
          color: Color(0xFFF6F6F7),
          borderRadius: BorderRadius.all(Radius.circular(11))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 5.0,
          ),
          Text(
            "Cancellation Policy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            "Free Cancellation",
            style: TextStyle(color: Color(0xFF505050)),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
