// ignore_for_file: library_private_types_in_public_api

import 'package:brokr/ui/guest/fragments/filters/widgets/bottom_bar_widget.dart';
import 'package:brokr/ui/guest/fragments/filters/widgets/row_checkbox_widget.dart';
import 'package:brokr/ui/guest/fragments/filters/widgets/row_list_widget.dart';
import 'package:brokr/ui/widgets/money_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/list_utils_filter.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import '../../pages/home/guest_home_controller.dart';
import 'widgets/header_filter_widget.dart';

class FilterBoatWidget extends StatefulWidget {
  const FilterBoatWidget({Key? key}) : super(key: key);

  @override
  _FilterBoatWidgetState createState() => _FilterBoatWidgetState();
}

class _FilterBoatWidgetState extends State<FilterBoatWidget> {
    final GuestHomeController guestHomeController = Get.find();
  String? dropDownValue1;
  double? sliderValue;
  String? dropDownValue2;
  String? dropDownValue3;
  String? dropDownValue4;
  String? dropDownValue5;
  String? radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Color bg = Colors.white;
  final Color gr = Colors.grey.shade600;
  TextStyle styleTitle = TextStyle(fontSize: 16, color: ThemeUtils.titleFilter);
  TextStyle dropDownStyle = const TextStyle(
      fontSize: 12,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5);
  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Jacuzzy',
      iconPath: "assets/boatfeatures/jacuzzy.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Red Wine',
      iconPath: "assets/boatfeatures/red_wine.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'WiFi',
      height: 25,
      width: 25,
      fontSizeText: 06,
      iconPath: "assets/boatfeatures/wifi.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Pets',
      iconPath: "assets/boatfeatures/pets.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Swimming',
      iconPath: "assets/boatfeatures/swim.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Alcohol',
      iconPath: "assets/boatfeatures/alcohol.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Bed Count',
      iconPath: "assets/boatfeatures/bed.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Shoes',
      iconPath: "assets/boatfeatures/shoes.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Fishing',
      iconPath: "assets/boatfeatures/fishing.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Snorkeling Gear',
      iconPath: "assets/boatfeatures/snork.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Jet Ski',
      iconPath: "assets/boatfeatures/jetski.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Fish Finder',
      iconPath: "assets/boatfeatures/fish.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Paddleboards',
      iconPath: "assets/boatfeatures/paddleboards.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Fishing Gear',
      iconPath: "assets/boatfeatures/fishing_gear.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Rod Holders',
      iconPath: "assets/boatfeatures/rod_holders.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      height: 25,
      width: 25,
      fontSizeText: 06,
      amenitie: 'Anchor',
      iconPath: "assets/boatfeatures/anchor.svg",
      color: Colors.black,
    ),
  ];
  int size = 0;

  bool valuePolicy = false;

  String sorby = ListUtilFilter.sortby[0];
  String makes = ListUtilFilter.makesBoats[0];
  String years = ListUtilFilter.years[0];
  String boats = ListUtilFilter.lengthBoats[0];
  String boatsType = ListUtilFilter.boatsType[0];

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const BouncingScrollPhysics(),
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
                    CustomRowWidget(
                      title: "Make",
                      hintText: makes,
                      options: ListUtilFilter.makesBoats,
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
                      title: "Lenght",
                      hintText: boats,
                      options: ListUtilFilter.lengthBoats,
                      refresh: (String value) {
                        boats = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    CustomRowWidget(
                      title: "Boats type",
                      hintText: boatsType,
                      options: ListUtilFilter.boatsType,
                      refresh: (String value) {
                        boatsType = value;
                        setState(() {});
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RowCheckBoxWidget(
                      title: "Free cancelation policy",
                      value: valuePolicy,
                      function: (bool value) {
                        valuePolicy = value;
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
               title: "Show 100 boats",
            callbackReset: () {
              for (var i = 0; i < sampleAmenities.length; i++) {
                sampleAmenities[i].pressed = false;
              }

              valuePolicy = false;
              size = 0;
              sorby = ListUtilFilter.sortby[0];
              makes = ListUtilFilter.makes[0];
              years = ListUtilFilter.years[0];
              boats = ListUtilFilter.lengthBoats[0];
              boatsType = ListUtilFilter.boatsType[0];
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
