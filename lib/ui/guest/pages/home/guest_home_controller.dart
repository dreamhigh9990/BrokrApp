import 'package:brokr/ui/guest/pages/home/fragments/home_fragment.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controllers/ticker_provider.dart';
import '../../../../models/super_model.dart';
import '../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../fragments/filters/car_filter.dart';
import '../../fragments/filters/boat_filter.dart';
import '../../fragments/filters/stay_filter.dart';
import 'fragments/chat_fragment.dart';
import 'fragments/favorites_fragment.dart';
import 'fragments/profile_fragment.dart';
import 'fragments/trips_fragment.dart';

class GuestHomeController extends GetxController {

    double percent = 1.0;

    double extent= 0.9;
    
  SuperModel? itemSelected;
  GoogleMapController? mapController;
  final GuestBottomSheests bottomSheests = GuestBottomSheests();
  ScrollController scrollListView = ScrollController();

  /* Position? currentPosition; */

  final duration = const Duration(milliseconds: 300);
  RxBool showFab = true.obs;

  RxInt groupValue = 0.obs;
  RxBool showMap = false.obs;
  Function(Function())? sheetState;
  List<List<SuperModel>> list = [];

  final sortCarItems = [
    'Relevance',
    'Price (Low to High)',
    'Price (High to Low)',
    'Newest',
    'Oldest',
  ];

  bool isVisible = true;
  set isSheetExpanded(bool value) {}

  String? sortCarValue;

  //Price Range
  RangeValues currentRangeValues = const RangeValues(100, 500);

  //Unlimited miles params
  bool unlimitedMiles = false;

  MyTickerProvider myTickerProvider = Get.find();
  final List<String> labelFragments = [
    'Explore',
    'Favorite',
    'Trips',
    'Inbox',
    'Profile',
  ];
//E:\proyectos_flutter\BrokrApp\assets\bottombar\routing.svg
  final iconFragments = [
    'assets/bottombar/searchnormal.svg',
    'assets/bottombar/heart.svg',
    'assets/bottombar/trips.svg',
    'assets/bottombar/tracking.svg',
    'assets/bottombar/profile.svg',
  ];

  final countNewNotifications = 0;

  int index = 0;
  late TabController tabController;

  bool showBottombar = true;
  Position? currentPosition;
  bool isLocationFetched = false;

  String? where;
  String? when;

  String simpleString = "Cars";

  List<SuperModel> favorites = [];
  @override
  void onInit() {
    showBottombar = true;
    /*  checkLocationPermission(); */
    tabController = TabController(
      initialIndex: 0,
      length: labelFragments.length,
      vsync: myTickerProvider,
    );
    list.add(SuperModel.getCars());
    list.add(SuperModel.getStay());
    //list.add(SuperModel.getYacht());
    list.add(SuperModel.getBoat());

    super.onInit();
  }




  @override
  void onClose() {
    tabController.dispose();
    mapController?.dispose();
    scrollListView.dispose();

    super.onClose();
  }

  void updateWidgetGlobal(String widget) {
    //print("actualizar widgets $widget");
    update([widget]);
  }

  void onMarkerTapped(int? markerId) {
    if (markerId != null) {
      itemSelected = list[groupValue.value][markerId];
    } else {
      itemSelected = null;
    }

    update(["item_select"]);
  }

  void onCancelSelected() {
    itemSelected = null;
    update(["item_select"]);
  }

  void onChangedMarker(int? markerId) {}

  void handleScroll() async {}

  void updatePage(int value) {
    index = value;
    tabController.index = value;
    tabController.animateTo(tabController.index);
    update(["guest_home_page", "bottom_bar"]);
  }

  Widget buildContent() {
    switch (index) {
      case 0:
        return  HomeFragment();
      case 1:
        return FavoritesFragment();
      case 2:
        return const TripsFragment();
      case 3:
        return  ChatFragment();
      case 4:
        return const ProfileFragment();
      default:
        return Container();
    }
  }

  void changeBottombar() {
    if (showMap.value == true && showBottombar == true) {
      showBottombar = !showBottombar;
    } else if (showMap.value == false && showBottombar == false) {
      showBottombar = !showBottombar;
    } else if (showMap.value == false && showBottombar == true) {
      showBottombar = !showBottombar;
    }
    update(["bottom_bar"]);
  }

  void offBottomBar() {
    if (showBottombar == true) {
      showBottombar = !showBottombar;
      update(["bottom_bar"]);
    }
    return;
  }

  void onBottomBar() {
    if (showBottombar == false) {
      showBottombar = !showBottombar;
      update(["bottom_bar"]);
    }
    return;
  }

  void updateWidget(int locale, int index) {
    list[groupValue.value][index].isFavourite =
        !list[groupValue.value][index].isFavourite!;
    update(["list_elements"]);
  }

  void updateListElements() {
    print("update list elements");
    update(["list_elements"]);
  }

  void buildFilters(BuildContext context) {
    changeBottombar();

    showGeneralDialog(
      context: context,
      pageBuilder: (_____, anim1, anim2) {
        return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  color: Colors.white,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                child: GetBuilder<GuestHomeController>(
                  id: "locale_widget_filters",
                  builder: (___) => [
                    FilterCarWidget(),
                    FilterStayWidget(
                      realoadingWidgetList: (String val) =>
                          updateWidgetGlobal(val),
                    ),
                    FilterBoatWidget(),
                  ][groupValue.value],
                ),
              ),
            ));
      },
      transitionBuilder: (___, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }
}
