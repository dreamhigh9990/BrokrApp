import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../text_align_left_widget.dart';

class PickUpReturnWidget extends StatelessWidget {
  const PickUpReturnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Pickup and Return",
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
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextAlignLeft(title: "Deliverd to You"),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile("Enter Your Address", "\$100"),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextAlignLeft(title: "Broker Default Address"),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile("Miami, FL 33131", "Free"),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextAlignLeft(title: "Delivery locations"),
                const SizedBox(
                  height: 10.0,
                ),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile("Miami International Airport", "\$100"),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile(
                    "Fort Laurderdale-Hollywood international Airport",
                    "\$100"),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile("Palm Beach International Airport", "\$150"),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile(
                    "Fort Laurderdal Airport Tri Rail Station", "\$100"),
                const Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                ),
                customListTile(
                    "Fort Laurderdal Airport Tri Rail Station", "\$100"),
              ],
            ),
          )),
    );
  }

  Widget customListTile(String title, String trailing) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      minLeadingWidth: 0.0,
      minVerticalPadding: 0.0,
      leading: Radio(
        activeColor: ThemeUtils.colorPurple,
        
        groupValue: null,
        onChanged: (Null? value) {},
        value: null,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap
      ),
      title: Text(
        title,
        style: TextStyle(fontFamily: ThemeUtils.interRegular, fontSize: 14),
      ),
      trailing: Text(
        trailing,
        style: TextStyle(fontFamily: ThemeUtils.interRegular, fontSize: 14),
      ),
    );
  }
}
