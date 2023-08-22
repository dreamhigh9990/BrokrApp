// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:brokr/ui/guest/fragments/filters/widgets/row_checkbox_widget.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/utils/list_utils_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/money_chart_widget.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import 'widgets/bottom_bar_widget.dart';
import 'widgets/header_filter_widget.dart';
import 'widgets/row_list_widget.dart';

class FilterCarWidget extends StatefulWidget {
  const FilterCarWidget({Key? key}) : super(key: key);

  @override
  _FilterCarWidgetState createState() => _FilterCarWidgetState();
}

class _FilterCarWidgetState extends State<FilterCarWidget> {

  final GuestHomeController guestHomeController = Get.find();
  bool miles = false, delivered = false, cancelation = false;
  String? dropDownValue1;
  double? sliderValue;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  String? dropDownValue5;
  String? radioButtonValue1;
  String? radioButtonValue2;
  String? radioButtonValue3;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int size = 0;
  final Color bg = Colors.white;
  final Color gr = Colors.grey.shade600;
  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Wheelchair Accesible',
        iconPath: "assets/carfeatures/wheelchair.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'All Wheel Drive',
        iconPath: "assets/carfeatures/allwheeldrive.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Android Auto',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/androidauto.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Apple Car Play',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/applecarplay.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'AUX Input',
        iconPath: "assets/carfeatures/auximput.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Backup Camera',
        iconPath: "assets/carfeatures/backupcamera.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        fontSizeText: 06,
        height: 25,
        width: 25,
        amenitie: 'Bike Rack',
        iconPath: "assets/carfeatures/bikerack.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Blind Spot Warning',
        iconPath: "assets/carfeatures/blindspotwarning.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Bluetooth',
        iconPath: "assets/carfeatures/bluetooth.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        fontSizeText: 06,
        height: 25,
        width: 25,
        amenitie: 'Child Seat',
        iconPath: "assets/carfeatures/childseatsecurity.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        fontSizeText: 06,
        height: 25,
        width: 25,
        amenitie: 'Convertible',
        iconPath: "assets/carfeatures/convertible.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'GPS',
        iconPath: "assets/carfeatures/gps.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        fontSizeText: 06,
        height: 25,
        width: 25,
        amenitie: 'Heated Seats',
        iconPath: "assets/carfeatures/heatedseats.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Ventilated Seat',
        fontSizeText: 06,
        height: 25,
        width: 25,
        iconPath: "assets/carfeatures/ventilatedseat.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Pet Friendly',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/petfriendly.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Ski Rack',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/skirack.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Snow Tires Or Chains',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/snowtires.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Sunroof',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/sunroof.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Toll Pass',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/tollpass.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Usb Charger',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/usbcharger.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Usb',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/usb.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Automatic Transmission',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/gearshiftcarautomatic.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        amenitie: 'Manual Transmission',
        fontSizeText: 06,
        iconPath: "assets/carfeatures/gearshiftcar.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Keyless Entry',
        iconPath: "assets/carfeatures/keylessentry.svg",
        color: const Color(0xFF1E161A)),
  ];

  String sorby = ListUtilFilter.sortby[0];
  String makes = ListUtilFilter.makes[0];
  String years = ListUtilFilter.years[0];
  String seats = ListUtilFilter.seats[0];
  String vehicleType = ListUtilFilter.vehicleType[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Get.context!.height * 0.02,
      ),
      child: Column(
        children: [
          HeaderTitleBar(title: "Filter ", size: size),
          Expanded(
            flex: 10,
            child: Container(
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              //   color: Colors.blue.shade100,
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    CustomRowWidget(
                      title: "Sort by",
                      hintText: sorby,
                      options: ListUtilFilter.sortby,
                      refresh: (String value) {
                        sorby = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Price Range',
                        style: TextStyle(
                            color: const Color(0xFF505050),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp),
                      ),
                    ),
                    const ColumnSeriesWidget(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomRowWidget(
                      title: "Make",
                      hintText: makes,
                      options: ListUtilFilter.makes,
                      refresh: (String value) {
                        makes = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomRowWidget(
                      title: "Years",
                      hintText: years,
                      options: ListUtilFilter.years,
                      refresh: (String value) {
                        years = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomRowWidget(
                      title: "Number of seats",
                      hintText: seats,
                      options: ListUtilFilter.seats,
                      refresh: (String value) {
                        seats = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomRowWidget(
                      title: "Vehicle type",
                      hintText: vehicleType,
                      options: ListUtilFilter.vehicleType,
                      refresh: (String value) {
                        vehicleType = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RowCheckBoxWidget(
                      title: "Unlimited miles",
                      value: miles,
                      function: (bool value) {
                        miles = value;

                        setState(() {});
                      },
                    ),
                    RowCheckBoxWidget(
                      title: "Delivered to you",
                      value: delivered,
                      function: (bool value) {
                        delivered = value;
                        setState(() {});
                      },
                    ),
                    RowCheckBoxWidget(
                      title: "Free cancelation policy",
                      value: cancelation,
                      function: (bool value) {
                        cancelation = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Features & Amenities',
                        style: TextStyle(
                            color: Color(0xFF505050),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.all(0.0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: sampleAmenities.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.05,
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int position) {
                        return AmenitiesTieWidget(
                            height: 25,
                            width: 25,
                            fontSizeText: 10,
                            pressed: sampleAmenities[position].pressed,
                            color: const Color(0xFF1E161A),
                            onChanged: () {
                              setState(() {
                                sampleAmenities[position].pressed =
                                    !sampleAmenities[position].pressed;

                                if (sampleAmenities[position].pressed == true) {
                                  size++;
                                } else {
                                  size--;
                                }
                              });

                              //title_stays
                            },
                            amenitie: sampleAmenities[position].amenitie,
                            iconPath: sampleAmenities[position].iconPath);
                      },
                    ),
                  ]),
            ),
          ),
          FilterBottomBarWidget(
            title: "Show 100 cars",
            callbackReset: () {
              for (var i = 0; i < sampleAmenities.length; i++) {
                sampleAmenities[i].pressed = false;
              }

              miles = false;

              delivered = false;
              cancelation = false;
              size = 0;
              print(sorby);
              sorby = ListUtilFilter.sortby[0];
              makes = ListUtilFilter.makes[0];
              years = ListUtilFilter.years[0];
              seats = ListUtilFilter.seats[0];
              vehicleType = ListUtilFilter.vehicleType[0];
              print("object");
              print(sorby);
              setState(() {});
            },
            save: () {
                   guestHomeController.changeBottombar();
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
