
import 'package:brokr/ui/widgets/booking_detail/locale/insurance_information_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


import '../widgets/normal_button.dart';

class BottomSheetsUtils {
  static buildBottomSheet({
    required BuildContext context,
    required Widget child,
    required double height,
    required Color color,
    required EdgeInsets padding,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
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

  Widget addCameraOrGallery(String title,
      {bool? anotherWidget = false, required BuildContext context}) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const SizedBox(
        height: 20.0,
      ),
      Text(
        title,
        style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            fontFamily: ThemeUtils.interRegular,
            color: Colors.black),
      ),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      button(
          function: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);

            if (image != null) {
              Get.back(result: {"files": image});
            }
          },
          title: "Add from gallery"),
      ThemeUtils.dividerGrey,
      button(
          function: () async {
              final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.camera);

            if (image != null) {
              Get.back(result: {"files": image});
            }

            
          },
          title: "Take a photo"),
      if (anotherWidget! == true) ...{
        ThemeUtils.dividerGrey,
        button(
            function: () async {
              Get.to(
                const InsuranceInformationWidget(),
              );
            },
            title: "Add info manually"),
      },
      ThemeUtils.dividerGrey,
      const Spacer(),
      customRow(),
    ]);
  }

  Widget button({
    required String title,
    required Function function,
  }) {
    return InkWell(
      onTap: () async {
        function();
      },
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: 60,
        child: Text(title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: ThemeUtils.titleFilter,
                fontFamily: ThemeUtils.interRegular)),
      ),
    );
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
        const SizedBox(
          height: 20.0,
        ),
        Text(
          "Select your birthday",
          style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              fontFamily: ThemeUtils.interRegular,
              color: Colors.black),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: CalendarDatePicker2(
              config: config, value: [], onValueChanged: (dates) => {}),
        ),
        customRow(),
      ]),
    );
  }

  Widget customRow() {
    return Container(
      height: Get.context!.height * 0.10,
      //color: Colors.green,
      padding: EdgeInsets.only(
        left: Get.context!.width * 0.05,
        right: Get.context!.width * 0.05,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: ThemeUtils.colorPurple, fontSize: 16.sp),
            ),
          ),
          NormalButton(
            height: 50,
            width: Get.context!.width * 0.35,
            text: 'Save',
            backgroundColor: ThemeUtils.colorPurple,
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
