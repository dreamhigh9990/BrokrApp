import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../bottom_sheets/geocoding_page.dart';
import '../guest_home_controller.dart';

class SearchBarWidget extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  final int groupValue;
  SearchBarWidget({
    super.key,
    required this.groupValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: ThemeUtils.borderShadowAppBar,
            right: ThemeUtils.borderShadowAppBar,
            top: Get.context!.height * 0.01),
        padding: const EdgeInsets.only(
          left: 10,
          top: 5,
          right: 10,
        ),
        height: 55,
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
                    print("hola");

                    var response = await GuestBottomSheests.buildBottomSheet(
                        color: const Color(0XFFF2F2F2),
                        context: context,
                        child: AddressGooglePlace(
                          titleTextField:
                              "City, postcode, address, airport or hotel...",
                          titleAppBar: "Where?",
                        ),
                        height: Get.context!.height);

                    /*              */
                  },
                  child: Container(
                    height: 55,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/icons/location.svg",
                            color: const Color(0xFF2E3E5C)),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const AutoSizeText(
                          "Where?",
                          style: TextStyle(color: Color(0xFFABB2BE)),
                        )
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
                if (guestHomeController.groupValue.value == 0) {
                  await GuestBottomSheests.buildBottomSheet(
                      color: const Color(0XFFF2F2F2),
                      context: context,
                      child: guestHomeController.bottomSheests.whenForCars(),
                      height: Get.context!.height);
                } else if (guestHomeController.groupValue.value == 1) {
                  await GuestBottomSheests.buildBottomSheet(
                      color: const Color(0XFFF2F2F2),
                      context: context,
                      child: guestHomeController.bottomSheests
                          .whenForStays(guestHomeController),
                      height: Get.context!.height);
                }

                 else  {
                  await GuestBottomSheests.buildBottomSheet(
                      color: const Color(0XFFF2F2F2),
                      context: context,
                      child: guestHomeController.bottomSheests
                          .whenForBoats(guestHomeController),
                      height: Get.context!.height);
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
                    const AutoSizeText(
                      "When?",
                      style: TextStyle(color: Color(0xFFABB2BE)),
                    )
                  ],
                ),
              ),
            )),
          ],
        ));
  }
}
