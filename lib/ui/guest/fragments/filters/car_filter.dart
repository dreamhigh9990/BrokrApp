// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:brokr/ui/guest/fragments/filters/widgets/row_checkbox_widget.dart';
import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
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

  final Color bg = Colors.white;
  final Color gr = Colors.grey.shade600;
  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
        amenitie: 'Wheelchair Accesible',
        iconPath: "assets/carfeatures/wheelchair.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'All Wheel Drive',
        iconPath: "assets/carfeatures/allwheeldrive.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Android Auto',
        iconPath: "assets/carfeatures/androidauto.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Apple Car Play',
        iconPath: "assets/carfeatures/applecarplay.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'AUX Input',
        iconPath: "assets/carfeatures/auximput.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Backup Camera',
        iconPath: "assets/carfeatures/backupcamera.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Bike Rack',
        iconPath: "assets/carfeatures/bikerack.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Blind Spot Warning',
        iconPath: "assets/carfeatures/blindspotwarning.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Bluetooth',
        iconPath: "assets/carfeatures/bluetooth.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Child Seat',
        iconPath: "assets/carfeatures/childseatsecurity.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Convertible',
        iconPath: "assets/carfeatures/convertible.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'GPS',
        iconPath: "assets/carfeatures/gps.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Heated Seats',
        iconPath: "assets/carfeatures/heatedseats.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Ventilated Seat',
        iconPath: "assets/carfeatures/ventilatedseat.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Pet Friendly',
        iconPath: "assets/carfeatures/petfriendly.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Ski Rack',
        iconPath: "assets/carfeatures/skirack.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Snow Tires Or Chains',
        iconPath: "assets/carfeatures/snowtires.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Sunroof',
        iconPath: "assets/carfeatures/sunroof.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Toll Pass',
        iconPath: "assets/carfeatures/tollpass.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Usb Charger',
        iconPath: "assets/carfeatures/usbcharger.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Usb',
        iconPath: "assets/carfeatures/usb.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Automatic Transmission',
        iconPath: "assets/carfeatures/gearshiftcarautomatic.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Manual Transmission',
        iconPath: "assets/carfeatures/gearshiftcar.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Keyless Entry',
        iconPath: "assets/carfeatures/keylessentry.svg",
        color: const Color(0xFF1E161A)),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.context!.height * 0.02,
        bottom: Get.context!.height * 0.02,
      ),
      child: Column(
        children: [
          Expanded(
            child: HeaderTitleBar(title: "Filter Cars"),
          ),
          Expanded(
            flex: 7,
            child: Container(
              //  color: Colors.green.shade100,
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const CustomRowWidget(
                        title: "Sort by", hintText: "Relevance"),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Price Range',
                        style: TextStyle(
                            color: Color(0xFF505050),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const ColumnSeriesWidget(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const CustomRowWidget(title: "Make", hintText: "All makes"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CustomRowWidget(
                        title: "Years", hintText: "All years"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CustomRowWidget(
                        title: "Number of seats", hintText: "All Seats"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CustomRowWidget(
                        title: "Vehicle type", hintText: "All types"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const RowCheckBoxWidget(title: "Unlimited miles"),
                    const RowCheckBoxWidget(title: "Delivered to you"),
                    const RowCheckBoxWidget(title: "Free cancelation policy"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Features',
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
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (BuildContext context, int position) {
                        return GestureDetector(
                            onTap: () {}, child: sampleAmenities[position]);
                      },
                    ),
                  ]),
            ),
          ),
          const FilterBottomBarWidget(),
        ],
      ),
    );
  }
}
