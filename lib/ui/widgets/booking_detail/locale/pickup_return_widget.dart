// ignore_for_file: must_be_immutable

import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../bottom_sheets/geocoding_page.dart';
import '../../bottom_bar_container_full_widget.dart';
import '../../text_align_left_widget.dart';

enum PickUpReturn {
  address,
  defaultaddress,
  miami,
  airport,
  international,
  fort,
  station
}

class PickUpReturnWidget extends StatefulWidget {
  const PickUpReturnWidget({super.key});

  @override
  State<PickUpReturnWidget> createState() => _PickUpReturnWidgetState();
}

class _PickUpReturnWidgetState extends State<PickUpReturnWidget> {
  PickUpReturn? pickUpReturn = PickUpReturn.defaultaddress;
  String myAddress = "Enter Your Address";
  String pickLocation = "Enter Your Address";
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
                  customListTile(myAddress, "\$100", PickUpReturn.address),
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
                  customListTile(
                      "Miami, FL 33131", "Free", PickUpReturn.defaultaddress),
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
                  customListTile("Miami International Airport", "\$100",
                      PickUpReturn.airport),
                  const Divider(
                    color: Colors.grey,
                    endIndent: 0.0,
                    height: 0.0,
                  ),
                  customListTile("Palm Beach International Airport", "\$150",
                      PickUpReturn.international),
                  const Divider(
                    color: Colors.grey,
                    endIndent: 0.0,
                    height: 0.0,
                  ),
                  customListTile("Fort Laurderdal Airport Tri Rail Station",
                      "\$100", PickUpReturn.fort),
                  const Divider(
                    color: Colors.grey,
                    endIndent: 0.0,
                    height: 0.0,
                  ),
                  customListTile("Fort Laurderdal Airport Tri Rail Station",
                      "\$100", PickUpReturn.station),
                ],
              ),
            )),
        bottomNavigationBar:
            BottomBarContainerFullWidget(ontap: () {

              Get.back(
                result: {
                  "result":pickLocation,
                }
              );
            }, title: "Save"));
  }

  Widget customListTile(String title, String trailing, PickUpReturn value) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      minLeadingWidth: 0.0,
      minVerticalPadding: 0.0,
      leading: Radio<PickUpReturn>(
          activeColor: ThemeUtils.colorPurple,
          value: value,
          groupValue: pickUpReturn,
          onChanged: (PickUpReturn? locale) async {
            pickUpReturn = locale;

            if (value.name == "address") {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild: AddressGooglePlace(
                    titleTextField:
                        "City, postcode, address, airport or hotel...",
                    titleAppBar: "Where?",
                  ),
                  height: Get.context!.height * 0.92);

              if (response != null) {
                String valueLocation = response["result"] as String;
                myAddress = valueLocation;
                pickLocation = title;
              }
            } else {
              pickLocation = title;
            }

            setState(() {});
          },
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
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
