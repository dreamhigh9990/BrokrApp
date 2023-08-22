// ignore_for_file: library_private_types_in_public_api
import 'package:auto_size_text/auto_size_text.dart';

import 'package:brokr/models/numbers_model.dart';
import 'package:brokr/ui/guest/fragments/filters/widgets/bottom_bar_widget.dart';
import 'package:brokr/ui/widgets/aux_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../utils/list_utils_filter.dart';
import '../../../widgets/money_chart_widget.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import '../../../widgets/tiles/number_widget.dart';
import '../../pages/home/guest_home_controller.dart';
import 'widgets/header_filter_widget.dart';
import 'widgets/row_list_widget.dart';

class FilterStayWidget extends StatefulWidget {
  final Function(String) realoadingWidgetList;
  FilterStayWidget({
    Key? key,
    required this.realoadingWidgetList,
  }) : super(key: key);

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
      height: 25,
      width: 25,
      fontSizeText: 06,
      color: const Color(0xFF1E161A),
      amenitie: 'Air Conditioning',
      iconPath: "assets/stayfeatures/airconditioning.svg",
    ),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Back Yard',
        iconPath: "assets/stayfeatures/backyard.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Balcony',
        iconPath: "assets/stayfeatures/balcony.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Barbecue',
        iconPath: "assets/stayfeatures/barbecue.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Dryer',
        iconPath: "assets/stayfeatures/dryer.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Coffee Maker',
        iconPath: "assets/stayfeatures/coffeemaker.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Freezer',
        iconPath: "assets/stayfeatures/freezer.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Fridge',
        iconPath: "assets/stayfeatures/fridge.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Breakfast',
        iconPath: "assets/stayfeatures/breakfast.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Chimney',
        iconPath: "assets/stayfeatures/chimney.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Cigarette',
        iconPath: "assets/stayfeatures/cigarette.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Cradle',
        iconPath: "assets/stayfeatures/cradle.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Dishwasher',
        iconPath: "assets/stayfeatures/dishwasher.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Electric Car Charger',
        iconPath: "assets/stayfeatures/electriccarcharger.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Garden',
        iconPath: "assets/stayfeatures/garden.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Gym',
        iconPath: "assets/stayfeatures/gym.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Movie Teather',
        iconPath: "assets/stayfeatures/movie.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Hair Dryer',
        iconPath: "assets/stayfeatures/hairdryer.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Heating',
        iconPath: "assets/stayfeatures/heating.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Hot Iron',
        iconPath: "assets/stayfeatures/hotiron.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Hot Shower',
        iconPath: "assets/stayfeatures/hotshower.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Indoor Fireplace',
        iconPath: "assets/stayfeatures/Indoorfireplace.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Jacuzzi',
        iconPath: "assets/stayfeatures/jacuzzi.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Kitchen',
        iconPath: "assets/stayfeatures/kitchen.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Microwave',
        iconPath: "assets/stayfeatures/microwave.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'NoCigarette',
        iconPath: "assets/stayfeatures/nocigarette.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Outdoor Shower',
        iconPath: "assets/stayfeatures/outdoorshower.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Oven',
        iconPath: "assets/stayfeatures/oven.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Parking Lot',
        iconPath: "assets/stayfeatures/parkinglot.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Pool',
        iconPath: "assets/stayfeatures/pool.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Sunroof',
        iconPath: "assets/stayfeatures/poolTable.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Beachfront',
        iconPath: "assets/stayfeatures/seaview.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Smoke Detector',
        iconPath: "assets/stayfeatures/smokedetector.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Monoxide Detector',
        iconPath: "assets/stayfeatures/smokedetector.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Terrace',
        iconPath: "assets/stayfeatures/terrace.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Theater At Home',
        iconPath: "assets/stayfeatures/theaterathome.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Tv',
        iconPath: "assets/stayfeatures/tv.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Washing Mmachine',
        iconPath: "assets/stayfeatures/washingmachine.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Wifi',
        iconPath: "assets/stayfeatures/wifi.svg",
        color: const Color(0xFF1E161A)),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        amenitie: 'Workplace',
        iconPath: "assets/stayfeatures/workplace.svg",
        color: const Color(0xFF1E161A)),
  ];

  List<AmenitiesTieWidget> features = [
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        color: const Color(0xFF1E161A),
        amenitie: 'House',
        iconPath: "assets/stayfilters/House.svg"),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        color: const Color(0xFF1E161A),
        amenitie: 'Apartment',
        iconPath: "assets/stayfilters/apartament.svg"),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        color: const Color(0xFF1E161A),
        amenitie: 'Mansion',
        iconPath: "assets/stayfilters/Mansion.svg"),
    AmenitiesTieWidget(
        height: 25,
        width: 25,
        fontSizeText: 06,
        color: const Color(0xFF1E161A),
        amenitie: 'Townhouse',
        iconPath: "assets/stayfilters/Townhouse.svg"),
  ];

  List<NumbersModel> listNumberBedrooms = NumbersModel.getListNumbers();
  List<NumbersModel> listNumberBeds = NumbersModel.getListNumbers();
  List<NumbersModel> listNumberBathRooms = NumbersModel.getListNumbers();

  final GuestHomeController controller = Get.find();
  int size = 0;
  String sorby = ListUtilFilter.sortby[0];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestHomeController>(
      id: "stays_filters",
      builder: (__) => Padding(
        padding: EdgeInsets.only(
          top: Get.context!.height * 0.02,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.05,
                          crossAxisCount: 4,
                        ),
                        padding: const EdgeInsets.all(0.0),
                        itemBuilder: (BuildContext context, int position) {
                          return AmenitiesTieWidget(
                              pressed: features[position].pressed,
                              onChanged: () {
                                setState(() {
                                  features[position].pressed =
                                      !features[position].pressed;
                                });
                              },
                              height: 25,
                              width: 25,
                              fontSizeText: 06,
                              color: const Color(0xFF1E161A),
                              amenitie: features[position].amenitie,
                              iconPath: features[position].iconPath);
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      custoRow(title: "Bedrooms", list: listNumberBedrooms),
                      const SizedBox(
                        height: 10.0,
                      ),
                      custoRow(title: "Beds", list: listNumberBeds),
                      const SizedBox(
                        height: 10.0,
                      ),
                      custoRow(title: "Bathrooms", list: listNumberBathRooms),
                      const SizedBox(
                        height: 20.0,
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
                        shrinkWrap: true,
                        itemCount: sampleAmenities.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.05,
                          crossAxisCount: 3,
                        ),
                        padding: const EdgeInsets.all(0.0),
                        physics: const NeverScrollableScrollPhysics(),
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

                                  if (sampleAmenities[position].pressed ==
                                      true) {
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
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ),
            FilterBottomBarWidget(
                 title: "Show 100 stays",
              callbackReset: () {
                for (var i = 0; i < sampleAmenities.length; i++) {
                  sampleAmenities[i].pressed = false;
                }

                for (var i = 0; i < listNumberBedrooms.length; i++) {
                  listNumberBedrooms[i].isChecked = false;
                }

                for (var i = 0; i < listNumberBeds.length; i++) {
                  listNumberBeds[i].isChecked = false;
                }
                for (var i = 0; i < listNumberBathRooms.length; i++) {
                  listNumberBathRooms[i].isChecked = false;
                }

                for (var i = 0; i < sampleAmenities.length; i++) {
                  sampleAmenities[i].pressed = false;
                }

                size = 0;
                  sorby = ListUtilFilter.sortby[0];
                setState(() {});

             
              },
              save: () {
                  controller.changeBottombar();
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget custoRow({required String title, required List<NumbersModel> list}) {
    return SizedBox(
        width: Get.context!.width,
        height: 41,
        child: Row(
          children: [
            SizedBox(
              width: Get.context!.width * 0.25,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      color: const Color(0xFF505050),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
            ),
            GetBuilder<GuestHomeController>(
              id: title,
              builder: (__) => Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    shrinkWrap: false,
                    cacheExtent: double.maxFinite,
                    physics: const BouncingScrollPhysics(),
                    itemCount: list.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (__, index) {
                      return NumberWidgetModel(
                          pressed: list[index].isChecked,
                          function: () {
                            for (var i = 0; i < list.length; i++) {
                              list[i].isChecked = false;
                            }
                            list[index].isChecked = !list[index].isChecked;
                            widget.realoadingWidgetList(title);
                          },
                          index: index,
                          title: list[index].label);
                    }),
              ),
            ),
          ],
        ));
  }
}
