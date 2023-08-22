// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/utils/google_api.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'widgets/header_bar_widget.dart';

class AddressGooglePlace extends StatefulWidget {
  final String titleTextField;
  String? titleAppBar;
  AddressGooglePlace({
    super.key,
    required this.titleTextField,
    this.titleAppBar = "Location",
  });
  @override
  _AddressGooglePlaceState createState() => _AddressGooglePlaceState();
}

class _AddressGooglePlaceState extends State<AddressGooglePlace> {
  final GuestHomeController guetsHomeController = Get.find();
  TextEditingController controller = TextEditingController();
  List<String> predictions = [];
  GoogleApi serviceGoogleApi = GoogleApi();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        HeaderBarWidget(title: "Where?", radius: true,functionClear: ()async{
          controller.text="";

          predictions =[];
          setState(() {
            
          });
        }),
        const SizedBox(
          height: 20.0,
        ),
        Container(
          padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
              top: 10.0,
              bottom: 10.0),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0))),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    ThemeUtils.shadowCard,
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: controller,
                  onChanged: (String value) async {
                    predictions = await serviceGoogleApi.searchPlaces(value);
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.location_on_outlined,
                          color: Color(0xFF2E3E5C)),
                      hintText: widget.titleTextField,
                      // ignore: prefer_const_constructors
                      hintStyle: TextStyle(fontSize: 12)),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (guetsHomeController.currentPosition != null) {
                    Position locale = guetsHomeController.currentPosition!;
                    String address =
                        await serviceGoogleApi.getAddressFromLatLng(
                            locale.latitude, locale.longitude);
                    if (address.isNotEmpty) {
                      controller.text = address;

                      Get.back(result: {
                        "result": controller.text,
                      });
                    }
                  }
                },
                child: Container(
                  height: 65,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.65,
                      ),
                    ),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 15.0,
                        ),
                        SvgPicture.asset("assets/icons/current_location.svg"),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Text(
                          "Current Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ]),
                ),
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: predictions.length,
                itemBuilder: (context, index) {
                  final prediction = predictions[index];

                  return Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 0.65,
                        ),
                      ),
                    ),
                    child: ListTile(
                      minLeadingWidth: 0.0,
                      minVerticalPadding: 0.0,
                      leading:
                          SvgPicture.asset("assets/icons/clock_location.svg"),
                      title: Text(
                        prediction,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        controller.text = prediction;

                        Get.back(result: {
                          "result": controller.text,
                        });
                        setState(() {
                          predictions = [];
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
