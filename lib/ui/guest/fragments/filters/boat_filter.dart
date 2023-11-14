// ignore_for_file: library_private_types_in_public_api

import 'package:brokr/ui/guest/fragments/filters/widgets/bottom_bar_widget.dart';
import 'package:brokr/ui/guest/fragments/filters/widgets/row_checkbox_widget.dart';
import 'package:brokr/ui/guest/fragments/filters/widgets/row_list_widget.dart';
import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:brokr/ui/widgets/money_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/normal_button.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import 'widgets/header_filter_widget.dart';

class FilterBoatWidget extends StatefulWidget {
  const FilterBoatWidget({Key? key}) : super(key: key);

  @override
  _FilterBoatWidgetState createState() => _FilterBoatWidgetState();
}

class _FilterBoatWidgetState extends State<FilterBoatWidget> {
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
      amenitie: 'Jacuzzy',
      iconPath: "assets/boatfeatures/jacuzzy.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Red Wine',
      iconPath: "assets/boatfeatures/red_wine.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'WiFi',
      iconPath: "assets/boatfeatures/wifi.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Pets',
      iconPath: "assets/boatfeatures/pets.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Swimming',
      iconPath: "assets/boatfeatures/swim.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Alcohol',
      iconPath: "assets/boatfeatures/alcohol.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Bed Count',
      iconPath: "assets/boatfeatures/bed.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Shoes',
      iconPath: "assets/boatfeatures/shoes.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Fishing',
      iconPath: "assets/boatfeatures/fishing.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Snorkeling Gear',
      iconPath: "assets/boatfeatures/snork.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Jet Ski',
      iconPath: "assets/boatfeatures/jetski.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Fish Finder',
      iconPath: "assets/boatfeatures/fish.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Paddleboards',
      iconPath: "assets/boatfeatures/paddleboards.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Fishing Gear',
      iconPath: "assets/boatfeatures/fishing_gear.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Rod Holders',
      iconPath: "assets/boatfeatures/rod_holders.svg",
      color: Colors.black,
    ),
    AmenitiesTieWidget(
      amenitie: 'Anchor',
      iconPath: "assets/boatfeatures/anchor.svg",
      color: Colors.black,
    ),
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
            child: HeaderTitleBar(title: "Filter Boats"),
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
                        title: "Lenght", hintText: "All Lenght"),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const CustomRowWidget(
                        title: "Boats type", hintText: "All types"),
                    const SizedBox(
                      height: 10.0,
                    ),
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
