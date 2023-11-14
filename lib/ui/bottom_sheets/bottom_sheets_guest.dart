import 'package:brokr/ui/bottom_sheets/hours_list_widget.dart';
import 'package:brokr/ui/bottom_sheets/widgets/header_bar_widget.dart';
import 'package:brokr/ui/widgets/text_align_left_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../guest/pages/home/guest_home_controller.dart';
import 'calendar_months_widget.dart';
import '../widgets/normal_button.dart';
import 'guest_widget.dart';
import 'number_list_widget.dart';

class GuestBottomSheests {
  //where and where bottom sheet

  static buildBottomSheet({
    required BuildContext context,
    required Widget child,
    required double height,
    required Color color,
    // required EdgeInsets padding,
  }) async {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            child: SafeArea(
              child: Container(
                //  padding: padding,
                height: height,
                width: Get.context!.width,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(40)),
                child: child,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return AnimatedBuilder(
          animation: anim,
          builder: (_, child) {
            return FractionalTranslation(
              translation: tween.evaluate(anim),
              child: Opacity(
                opacity: anim.value,
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );
  }

  Widget whenForCars() {
    return Column(children: [
      const HeaderBarWidget(title: "Select Dates"),
      Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        padding: EdgeInsets.only(
            top: Get.context!.height * 0.05,
            left: Get.context!.width * 0.025,
            right: Get.context!.width * 0.025),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
            margin: EdgeInsets.only(
              left: Get.context!.width * 0.015,
              right: Get.context!.width * 0.015,
            ),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  offset: Offset(0, 1),
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextField(
              onChanged: (String val) {},
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  prefixIcon: const Icon(Icons.location_on_outlined,
                      color: Color(0xFF2E3E5C)),
                  hintText: "Bloomfield , 72 Avenue 18374-398",
                  hintStyle: const TextStyle(fontSize: 12)),
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.035,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
                width: Get.context!.width * 0.40,
                child: InputDecorator(
                  decoration: ThemeUtils.inputDecoration(
                      fontWeight: FontWeight.normal,
                      isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      labelText: "Pickup Date"),
                  child: const Center(child: Text("22/11/2023")),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              SizedBox(
                height: 50,
                width: Get.context!.width * 0.40,
                child: InputDecorator(
                  decoration: ThemeUtils.inputDecoration(
                      fontWeight: FontWeight.normal,
                      isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      labelText: "Return Date"),
                  child: const Center(child: Text("25/11/2023")),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
                top: 10.0,
                bottom: 10.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            height: Get.context!.height * 0.30,
            child: const DatePickerCustom(),
          ),
          SizedBox(
              height: 40,
              width: Get.context!.width,
              child: Row(
                children: [
                  Text("Start",
                      style: TextStyle(
                          fontFamily: ThemeUtils.interRegular,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Expanded(
                    child: HoursListWidget(),
                  ),
                ],
              )),
          SizedBox(
            height: Get.context!.height * 0.02,
          ),
          SizedBox(
              height: 40,
              width: Get.context!.width,
              child: Row(
                children: [
                  Text("End",
                      style: TextStyle(
                          fontFamily: ThemeUtils.interRegular,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  const Expanded(
                    child: HoursListWidget(),
                  ),
                ],
              )),
          SizedBox(
            height: Get.context!.height * 0.04,
          ),
          NormalButton(
            backgroundColor: ThemeUtils.colorPurple,
            text: 'Search',
            onTap: () {},
            cornersRadius: 8,
          ),
        ]),
      )
    ]);
  }

  Widget whosTravelingWithYou() {
    return const GuessWidget();
  }

  Widget whenForStays(GuestHomeController guestHomeController) {
    return SingleChildScrollView(
      child: Column(children: [
        const HeaderBarWidget(title: "Select Dates"),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          padding: EdgeInsets.only(
              top: Get.context!.height * 0.05,
              left: Get.context!.width * 0.025,
              right: Get.context!.width * 0.025),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Get.context!.width * 0.015,
                    right: Get.context!.width * 0.015,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 1),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: (String val) {},
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(Icons.location_on_outlined,
                            color: Color(0xFF2E3E5C)),
                        hintText: "Bloomfield , 72 Avenue 18374-398",
                        hintStyle: const TextStyle(fontSize: 12)),
                  ),
                ),
                SizedBox(
                  height: Get.context!.height * 0.035,
                ),
                customRow(),
                Container(
                  padding: EdgeInsets.only(
                      left: Get.context!.width * 0.05,
                      right: Get.context!.width * 0.05,
                      top: 10.0,
                      bottom: 10.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  height: Get.context!.height * 0.39,
                  child: const DatePickerCustom(),
                ),
                TextAlignLeft(
                  title: "Who’s traveling with you?",
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () async {
                    await GuestBottomSheests.buildBottomSheet(
                        color: const Color(0XFFF2F2F2),
                        context: Get.context!,
                        child: guestHomeController.bottomSheests
                            .whosTravelingWithYou(),
                        height: Get.context!.height);
                  },
                  child: SizedBox(
                    height: 50,
                    width: Get.context!.width,
                    child: InputDecorator(
                        decoration: ThemeUtils.inputDecoration(
                            fontWeight: FontWeight.normal,
                            isPadding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            labelText: "Who"),
                        child: Row(
                          children: const [
                            Icon(Icons.people_outline),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("")
                          ],
                        )),
                  ),
                ),
                SizedBox(
                  height: Get.context!.height * 0.04,
                ),
                NormalButton(
                  backgroundColor: ThemeUtils.colorPurple,
                  text: 'Search',
                  onTap: () {},
                  cornersRadius: 8,
                ),
                SizedBox(
                  height: Get.context!.height * 0.04,
                ),
              ]),
        )
      ]),
    );
  }

  Widget whenForBoats(GuestHomeController guestHomeController) {
    return SingleChildScrollView(
      child: Column(children: [
        const HeaderBarWidget(title: "Select Dates"),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0))),
          padding: EdgeInsets.only(
              top: Get.context!.height * 0.05,
              left: Get.context!.width * 0.025,
              right: Get.context!.width * 0.025),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Get.context!.width * 0.015,
                    right: Get.context!.width * 0.015,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 1),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: (String val) {},
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        prefixIcon: const Icon(Icons.location_on_outlined,
                            color: Color(0xFF2E3E5C)),
                        hintText: "Bloomfield , 72 Avenue 18374-398",
                        hintStyle: const TextStyle(fontSize: 12)),
                  ),
                ),
                SizedBox(
                  height: Get.context!.height * 0.035,
                ),
                SizedBox(
                    height: 50,
                    width: Get.context!.width,
                    child: InputDecorator(
                        decoration: ThemeUtils.inputDecoration(
                            fontWeight: FontWeight.normal,
                            isPadding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            labelText: "When"),
                        child: const Center(
                          child: Text("25/11/2023"),
                        ))),
                Container(
                  padding: EdgeInsets.only(
                      left: Get.context!.width * 0.05,
                      right: Get.context!.width * 0.05,
                      top: 10.0,
                      bottom: 10.0),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.0),
                          topRight: Radius.circular(15.0))),
                  height: Get.context!.height * 0.39,
                  child: const DatePickerCustom(),
                ),
                TextAlignLeft(
                  title: "How Many Passengers?",
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: () async {
                    await GuestBottomSheests.buildBottomSheet(
                        color: const Color(0XFFF2F2F2),
                        context: Get.context!,
                        child: guestHomeController.bottomSheests
                            .whosTravelingWithYou(),
                        height: Get.context!.height);
                  },
                  child: SizedBox(
                    height: 50,
                    width: Get.context!.width,
                    child: InputDecorator(
                        decoration: ThemeUtils.inputDecoration(
                            fontWeight: FontWeight.normal,
                            isPadding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            labelText: "Passengers"),
                        child: Row(
                          children: const [
                            Icon(Icons.people_outline),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text("")
                          ],
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    height: 40,
                    width: Get.context!.width,
                    child: Row(
                      children: [
                        Text("How Many Hour",
                            style: TextStyle(
                                fontFamily: ThemeUtils.interRegular,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Expanded(
                          child: NumberListWidget(),
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                    height: 40,
                    width: Get.context!.width,
                    child: Row(
                      children: [
                        Text("Departure Time",
                            style: TextStyle(
                                fontFamily: ThemeUtils.interRegular,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Expanded(
                          child: HoursListWidget(),
                        ),
                      ],
                    )),
                SizedBox(
                  height: Get.context!.height * 0.04,
                ),
                NormalButton(
                  backgroundColor: ThemeUtils.colorPurple,
                  text: 'Search',
                  onTap: () {},
                  cornersRadius: 8,
                ),
                SizedBox(
                  height: Get.context!.height * 0.04,
                ),
              ]),
        )
      ]),
    );
  }

  Widget customRow() {
    return SizedBox(
      height: 50,
      width: Get.context!.width,
      child: InputDecorator(
        decoration: ThemeUtils.inputDecoration(
            fontWeight: FontWeight.normal,
            isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
            labelText: "When"),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Text(
                "Nov 22/23",
                style: TextStyle(),
              ),
            ),
            Container(
              width: 1.5,
              height: 30.0,
              color: Colors.black.withOpacity(.5),
            ),
            const Center(
              child: Text(
                "Nov 22/23",
                style: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
