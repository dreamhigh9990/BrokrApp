// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/numbers_model.dart';
import 'package:brokr/ui/guest/fragments/filters/widgets/bottom_bar_widget.dart';
import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/theme_utils.dart';
import '../../../widgets/money_chart_widget.dart';
import '../../../widgets/normal_button.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import 'widgets/header_filter_widget.dart';

class FilterStayWidget extends StatefulWidget {
  const FilterStayWidget({Key? key}) : super(key: key);

  @override
  _FilterStayWidgetState createState() => _FilterStayWidgetState();
}

class _FilterStayWidgetState extends State<FilterStayWidget> {
  String? dropDownValue;
  double? sliderValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final Color bg = Colors.white;
  final Color gr = Colors.grey.shade600;
  TextStyle dropDownStyle = const TextStyle(
      fontSize: 12,
      color: Color(0xFF505050),
      fontWeight: FontWeight.normal,
      letterSpacing: 0.5);

  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
        amenitie: 'Air Conditioning',
        iconPath: "assets/stayfeatures/airconditioning.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Back Yard',
        iconPath: "assets/stayfeatures/backyard.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Balcony',
        iconPath: "assets/stayfeatures/balcony.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Barbecue',
        iconPath: "assets/stayfeatures/barbecue.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Dryer',
        iconPath: "assets/stayfeatures/dryer.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Coffee Maker',
        iconPath: "assets/stayfeatures/coffeemaker.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Freezer',
        iconPath: "assets/stayfeatures/freezer.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Fridge',
        iconPath: "assets/stayfeatures/fridge.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Breakfast',
        iconPath: "assets/stayfeatures/breakfast.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Chimney',
        iconPath: "assets/stayfeatures/chimney.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Cigarette',
        iconPath: "assets/stayfeatures/cigarette.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Cradle',
        iconPath: "assets/stayfeatures/cradle.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Dishwasher',
        iconPath: "assets/stayfeatures/dishwasher.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Electric Car Charger',
        iconPath: "assets/stayfeatures/electriccarcharger.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Garden',
        iconPath: "assets/stayfeatures/garden.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Gym',
        iconPath: "assets/stayfeatures/gym.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Movie Teather',
        iconPath: "assets/stayfeatures/movie.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Hair Dryer',
        iconPath: "assets/stayfeatures/hairdryer.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Heating',
        iconPath: "assets/stayfeatures/heating.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Hot Iron',
        iconPath: "assets/stayfeatures/hotiron.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Hot Shower',
        iconPath: "assets/stayfeatures/hotshower.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Indoor Fireplace',
        iconPath: "assets/stayfeatures/Indoorfireplace.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Jacuzzi',
        iconPath: "assets/stayfeatures/jacuzzi.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Kitchen',
        iconPath: "assets/stayfeatures/kitchen.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Microwave',
        iconPath: "assets/stayfeatures/microwave.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'NoCigarette',
        iconPath: "assets/stayfeatures/nocigarette.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Outdoor Shower',
        iconPath: "assets/stayfeatures/outdoorshower.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Oven',
        iconPath: "assets/stayfeatures/oven.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Parking Lot',
        iconPath: "assets/stayfeatures/parkinglot.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Pool',
        iconPath: "assets/stayfeatures/pool.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Sunroof',
        iconPath: "assets/stayfeatures/poolTable.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Beachfront',
        iconPath: "assets/stayfeatures/seaview.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Smoke Detector',
        iconPath: "assets/stayfeatures/smokedetector.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Monoxide Detector',
        iconPath: "assets/stayfeatures/smokedetector.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Terrace',
        iconPath: "assets/stayfeatures/terrace.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Theater At Home',
        iconPath: "assets/stayfeatures/theaterathome.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Tv',
        iconPath: "assets/stayfeatures/tv.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Washing Mmachine',
        iconPath: "assets/stayfeatures/washingmachine.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Wifi',
        iconPath: "assets/stayfeatures/wifi.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        amenitie: 'Workplace',
        iconPath: "assets/stayfeatures/workplace.svg",
        color: const Color(0xFF1E161A)),
  ];

  List<AmenitiesTieWidget> features = [
    AmenitiesTieWidget(
        color: const Color(0xFF1E161A),
        amenitie: 'House',
        iconPath: "assets/stayfilters/House.svg"),
    AmenitiesTieWidget(
        color: const Color(0xFF1E161A),
        amenitie: 'Apartment',
        iconPath: "assets/stayfilters/apartament.svg"),
    AmenitiesTieWidget(
        color: const Color(0xFF1E161A),
        amenitie: 'Mansion',
        iconPath: "assets/stayfilters/Mansion.svg"),
    AmenitiesTieWidget(
        color: const Color(0xFF1E161A),
        amenitie: 'Townhouse',
        iconPath: "assets/stayfilters/Townhouse.svg"),
  ];

  List<NumbersModel> listNumber = NumbersModel.getListNumbers();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.context!.height * 0.02,
        bottom: Get.context!.height * 0.02,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: HeaderTitleBar(title: "Filter Stays"),
          ),
          Expanded(
            flex: 7,
            child: Container(
                child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const AutoSizeText('Sort by ', style: TextStyle()),
                    const Spacer(),
                    FlutterFlowDropDown<String>(
                      options: const ['Option 1'],
                      onChanged: (val) => setState(() => dropDownValue = val),
                      width: 120,
                      height: 36,
                      textStyle: dropDownStyle,
                      hintText: 'Relevance',
                      fillColor: const Color(0xFFEFEFF0),
                      elevation: 2,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      borderRadius: 18,
                      margin: const EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
                      hidesUnderline: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: AutoSizeText(
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
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: features.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.05,
                    crossAxisCount: 4,
                  ),
                  padding: const EdgeInsets.all(0.0),
                  itemBuilder: (BuildContext context, int position) {
                    return GestureDetector(
                        onTap: () {}, child: features[position]);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                custoRow("Bedrooms"),
                const SizedBox(
                  height: 10.0,
                ),
                custoRow("Beds"),
                const SizedBox(
                  height: 10.0,
                ),
                custoRow("Bathrooms"),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Amenities',
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
                  shrinkWrap: true,
                  itemCount: sampleAmenities.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.05,
                    crossAxisCount: 4,
                  ),
                  padding: const EdgeInsets.all(0.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int position) {
                    return GestureDetector(
                        onTap: () {}, child: sampleAmenities[position]);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
          ),
             const FilterBottomBarWidget(),
        ],
      ),
    );
  }

  Widget custoRow(String title) {
    return Container(
        width: Get.context!.width,
        height: 41,
        child: Row(
          children: [
            Container(
              width: Get.context!.width * 0.25,
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  title,
                  style: const TextStyle(
                      color: Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: false,
                  cacheExtent: double.maxFinite,
                  physics: const BouncingScrollPhysics(),
                  itemCount: listNumber.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (__, index) {
                    return Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left:5, right: 5),
                        width:index == 0 ? 49 : 33,
                        height: 41,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(
                          listNumber[index].label,
                          style: const TextStyle(fontSize: 12),
                        ));
                  }),
            ),
          ],
        ));
  }
}
