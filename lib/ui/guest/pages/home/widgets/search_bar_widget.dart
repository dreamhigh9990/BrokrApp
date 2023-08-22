import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/bottom_sheets/hours_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../bottom_sheets/geocoding_page.dart';
import '../guest_home_controller.dart';

class SearchBarWidget extends StatefulWidget {
  final int groupValue;
  SearchBarWidget({
    super.key,
    required this.groupValue,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final GuestHomeController guestHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestHomeController>(
      id: "SearchBarWidget_Home",
      builder: (__) => Container(
          margin: EdgeInsets.only(
              left: ThemeUtils.borderShadowAppBar,
              right: ThemeUtils.borderShadowAppBar,
              top: Get.context!.height * 0.01),
          padding: const EdgeInsets.only(
            left: 10,
            top: 0,
            right: 10,
          ),
          height: 45,
          width: Get.context!.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 1),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () async {
                      callbackWhere(context);
                    },
                    child: Container(
                      height: 55,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                            //  color: Colors.red,
                            height: 20,
                            width: 20,
                            child: SvgPicture.asset("assets/icons/location.svg",
                                color: const Color(0xFF2E3E5C)),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                            child: Text(
                              guestHomeController.where ?? "Where?",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: const Color(0xFFABB2BE),
                                  overflow: TextOverflow.clip),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                width: 10.0,
              ),
              Container(
                height: 40,
                width: 1.0,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () async {
                  var response = await pressedWhere(
                    context: context,
                  );
                  print("caiste aca");
                  print(response);
                  if (response["pickupDate"] != null &&
                      response["returnDate"] != null) {
                    var array = response["pickupDate"].toString().split("/");
                    var arrayTwo = response["returnDate"].toString().split("/");
                    guestHomeController.when =
                        "${array[0]}/${array[1]} - ${arrayTwo[0]}/${arrayTwo[1]}";
                    guestHomeController
                        .updateWidgetGlobal("SearchBarWidget_Home");
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  height: 55,
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/calendar_clock.svg",
                          color: const Color(0xFF2E3E5C)),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Text(
                          guestHomeController.when ?? "When?",
                          style: TextStyle(
                              fontSize: 10.sp, color: const Color(0xFFABB2BE)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          )),
    );
  }

  void callbackWhere(BuildContext context) async {
    var response = await GuestBottomSheests.buildshowGeneralDialog(
        context: context,
        widgetChild: AddressGooglePlace(
          titleTextField: "City, postcode, address, airport or hotel...",
          titleAppBar: "Where?",
        ),
        height: Get.context!.height * 0.92);

    if (response != null) {
      String valueLocation = response["result"] as String;

      print(valueLocation);
      var map = await pressedWhere(
        context: context,
        location: valueLocation,
      );
      print(map);
      print("ESTAS ACA");
      guestHomeController.where = valueLocation;
      // guestHomeController.when = valueLocation;
      if (map["pickupDate"] != null && map["returnDate"] != null) {
        var array = map["pickupDate"].toString().split("/");
        var arrayTwo = map["returnDate"].toString().split("/");
        guestHomeController.when =
            "${array[0]}/${array[1]} - ${arrayTwo[0]}/${arrayTwo[1]}";
      }

      guestHomeController.updateWidgetGlobal("SearchBarWidget_Home");
    }
  }

  Future<Map<String, dynamic>> pressedWhere({
    required BuildContext context,
    String? location,
  }) async {
    print("MI LOCATION $location");

    if (location == null) {
      location = guestHomeController.where ?? "";
    }

    if (guestHomeController.groupValue.value == 0) {
      var response = await GuestBottomSheests.buildshowGeneralDialog(
          context: context,
          widgetChild: guestHomeController.bottomSheests.whenForCars(
            hourStart: HourModel(title: "", value: false),
            hourEnd: HourModel(title: "", value: false),
            controller: guestHomeController,
            location: location,
            getBackFunction: () {
              callbackWhere(context);
            },
          ),
          height: Get.context!.height * 0.9450);
      print("mi res $response");
      if (response != null) {
        print("HOLA");
        return response;
      }
      print("XSS");
      return {};
    } else if (guestHomeController.groupValue.value == 1) {
      var response = await GuestBottomSheests.buildshowGeneralDialog(
          context: context,
          widgetChild: guestHomeController.bottomSheests.whenForStays(
            guestHomeController,
            location: location,
            getBackFunction: () {
              callbackWhere(context);
            },
          ),
          height: Get.context!.height * 0.92);
      if (response != null) {
        print("HOLA");
        return response;
      }
      print("XSS");
      return {};
    } else {
      var response = await GuestBottomSheests.buildshowGeneralDialog(
          context: context,
          widgetChild: guestHomeController.bottomSheests.whenForBoats(
            guestHomeController,
            location: location,
            getBackFunction: () {
              callbackWhere(context);
            },
          ),
          height: Get.context!.height * 0.92);
      if (response != null) {
        print("HOLA");
        return response;
      }
      print("XSS");
      return {};
    }
  }
}
