import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/insurance_information_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomSheetsUtils {
  static buildBottomSheet({
    required BuildContext context,
    required Widget child,
    required double height,
    required Color color,
    required EdgeInsets padding,
  }) async {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child: Material(
              borderRadius: BorderRadius.circular(40),
              child: Container(
                padding: padding,
                height: height,
                width: Get.context!.width,
                decoration: ShapeDecoration(
                  color: color,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34.0),
                    topRight: Radius.circular(34.0),
                  )),
                ),
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

  Widget addCameraOrGallery(String title, {bool? anotherWidget = false}) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const SizedBox(
        height: 20.0,
      ),
      AutoSizeText(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: ThemeUtils.interRegular,
            color: Colors.black),
      ),
      const SizedBox(
        height: 20.0,
      ),
      InkWell(
        onTap: () {},
        child: Container(
          color: const Color.fromARGB(255, 247, 246, 246),
          height: 50,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  ("assets/icons/gallery.svg"),
                  color: ThemeUtils.titleFilter,
                ),
                AutoSizeText("Add From Gallery",
                    style: TextStyle(
                        color: ThemeUtils.titleFilter,
                        fontFamily: ThemeUtils.interRegular)),
                SizedBox(
                  width: Get.context!.width * 0.065,
                ),
              ]),
        ),
      ),
  
      const Divider(
        endIndent: 0.0,
        height: 0.0,
        indent: 0.0,
        thickness: 0.0,
        color: Colors.grey,
      ),
      InkWell(
        onTap: () {},
        child: Container(
          color: const Color.fromARGB(255, 247, 246, 246),
          height: 50,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  ("assets/icons/camera.svg"),
                  color: ThemeUtils.titleFilter,
                ),
                AutoSizeText("Take a photo",
                    style: TextStyle(
                        color: ThemeUtils.titleFilter,
                        fontFamily: ThemeUtils.interRegular)),
                SizedBox(
                  width: Get.context!.width * 0.065,
                ),
              ]),
        ),
      ),

          if (anotherWidget! == true) ...{
        const Divider(
          endIndent: 0.0,
          height: 0.0,
          indent: 0.0,
          thickness: 0.0,
          color: Colors.grey,
        ),
        InkWell(
          onTap: () {

            Get.to(
              const InsuranceInformationWidget(),
            );
          },
          child: Container(
            color: const Color.fromARGB(255, 247, 246, 246),
            height: 50,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    ("assets/icons/info_manually.svg"),
                    color: ThemeUtils.titleFilter,
                  ),
                  AutoSizeText("Add Info Manually",
                      style: TextStyle(
                          color: ThemeUtils.titleFilter,
                          fontFamily: ThemeUtils.interRegular)),
                  SizedBox(
                    width: Get.context!.width * 0.065,
                  ),
                ]),
          ),
        ),
      },
      const Spacer(),
      customRow(),
      const SizedBox(
        height: 10.0,
      ),
    ]);
  }

  Widget addCalendar() {
    final config = CalendarDatePicker2Config(
        calendarType: CalendarDatePicker2Type.single,
        selectedDayHighlightColor: ThemeUtils.colorPurple,
        weekdayLabelTextStyle: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.bold,
          fontFamily: ThemeUtils.interRegular,
        ),
        controlsTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          fontFamily: ThemeUtils.interRegular,
        ),
        centerAlignModePicker: true,
        customModePickerIcon: Container());

    return SizedBox(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Expanded(
          child: CalendarDatePicker2(
              config: config, value: [], onValueChanged: (dates) => {}),
        ),
        customRow(),
      ]),
    );
  }

  Widget customRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          child: AutoSizeText("Cancel",
              style: TextStyle(
                  fontFamily: ThemeUtils.interRegular,
                  color: ThemeUtils.colorPurple)),
        ),
        MaterialButton(
          height: 50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          minWidth: Get.context!.width * 0.3750,
          color: ThemeUtils.colorPurple,
          onPressed: () {
            Get.back();
          },
          child: AutoSizeText("Save",
              style: TextStyle(
                  fontFamily: ThemeUtils.interRegular, color: Colors.white)),
        )
      ],
    );
  }
}
