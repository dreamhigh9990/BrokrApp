import 'package:brokr/ui/guest/pages/home/fragments/home_fragment.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../controllers/ticker_provider.dart';
import '../../../../models/super_model.dart';
import '../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../fragments/filters/car_filter.dart';
import '../../fragments/filters/boat_filter.dart';
import '../../fragments/filters/stay_filter.dart';
import '../../fragments/filters/boat_filter.dart';
import 'fragments/chat_fragment.dart';
import 'fragments/favorites_fragment.dart';
import 'fragments/profile_fragment.dart';
import 'fragments/trips_fragment.dart';

class GuestHomeController extends GetxController {
  SuperModel? itemSelected;
  GoogleMapController? mapController;
  final GuestBottomSheests bottomSheests = GuestBottomSheests();

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

  final filters = const [
    FilterCarWidget(),
    FilterStayWidget(),
    //FilterYachtWidget(),
    FilterBoatWidget(),
  ];

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
    'assets/bottombar/search-normal.svg',
    'assets/bottombar/heart.svg',
    'assets/bottombar/routing.svg',
    'assets/bottombar/sms-tracking.svg',
    'assets/bottombar/profile.svg',
  ];

  final countNewNotifications = 0;

  int index = 0;
  late TabController tabController;

  bool showBottombar = true;

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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    mapController?.dispose();

    super.onClose();
  }

  void onMarkerTapped(int? markerId) {
    if (markerId != null) {
      itemSelected = list[groupValue.value][markerId];
    } else {
      itemSelected = null;
    }

    update(["change_screen"]);
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
        return const HomeFragment();
      case 1:
        return FavoritesFragment();
      case 2:
        return const TripsFragment();
      case 3:
        return const ChatFragment();
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

  void updateScreen() {
    update(["change_screen"]);
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

    showBottomSheet(
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      context: context,
      builder: (context2) => Container(
        margin: const EdgeInsets.only(
          top: 20.0,
        ),
        padding: EdgeInsets.only(
            left: Get.context!.width * 0.05, right: Get.context!.width * 0.05),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.95,
        child: StatefulBuilder(
          builder: (context3, setSheetState) {
            sheetState = setSheetState;
            return filters[groupValue.value];
          },
        ),
      ),
    );
  }

  /* Future getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
  }
 */
 /*   void checkLocationPermission() async {
    PermissionStatus permission = await Permission.location.request();
    if (permission.isGranted) {
      await getCurrentLocation();
    } else {
      // Manejar la denegación de permisos
      if (permission.isDenied) {
        // El usuario denegó los permisos
        // Puedes mostrar un diálogo o realizar alguna otra acción
        print('El usuario denegó los permisos de ubicación');
      } else if (permission.isPermanentlyDenied) {
        // El usuario seleccionó la opción "No preguntar de nuevo"
        // Puedes mostrar un diálogo y redirigir al usuario a la configuración de la aplicación para habilitar los permisos manualmente
        print('El usuario seleccionó "No preguntar de nuevo" para los permisos de ubicación');
      }
    }
  }
 */
  
}
