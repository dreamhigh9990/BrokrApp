// ignore_for_file: must_be_immutable

import 'package:brokr/ui/widgets/appbar_widget.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import '../../../../../utils/theme_utils.dart';

class MultiCalendarPage extends StatefulWidget {
  final DateTime today;

  MultiCalendarPage({super.key, required this.today});

  @override
  State<MultiCalendarPage> createState() => _MultiCalendarPageState();
}

class _MultiCalendarPageState extends State<MultiCalendarPage> {
  DateTime? beginDateTime;

  DateTime? endDateTime;

  List<DateTime?> multiDatePickerValueWithDefaultValue = [
    DateTime(2023, 05, 1),
  ];
  List<DateTime?> rangeDatePickerValueWithDefaultValue = [];

  final config = CalendarDatePicker2Config(
    calendarType: CalendarDatePicker2Type.range,
    selectedDayHighlightColor: ThemeUtils.colorPurple,
    weekdayLabelTextStyle: const TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
    ),
    controlsTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  );

  List<bool> isSelected = [true, false];
  @override
  void initState() {
    rangeDatePickerValueWithDefaultValue = [
      DateTime(widget.today.year, widget.today.month, widget.today.day),
      DateTime(
        widget.today.year,
        widget.today.month,
        widget.today.day,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(title: "Calendar", showLeading: true),
      body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 55,
                width: Get.context!.width * 0.55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black, width: 1.0)),
                alignment: Alignment.center,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          isSelected[0] = true;
                          isSelected[1] = false;

                          setState(() {});
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              color: isSelected[0]
                                  ? ThemeUtils.colorPurple
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Single day",
                              style: TextStyle(
                                  color: isSelected[0]
                                      ? Colors.white
                                      : Colors.black),
                            )),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          isSelected[1] = true;
                          isSelected[0] = false;

                          setState(() {});
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 80,
                            decoration: BoxDecoration(
                              color: isSelected[1]
                                  ? ThemeUtils.colorPurple
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              "Multi - day",
                              style: TextStyle(
                                  color: isSelected[1]
                                      ? Colors.white
                                      : Colors.black),
                            )),
                      ),
                    ]),
              ),
           Expanded(child:   isSelected[1] ? CalendarDatePicker2(
                config: config,
                value: rangeDatePickerValueWithDefaultValue,
                onValueChanged: (dates) => setState(
                    () => rangeDatePickerValueWithDefaultValue = dates),
              ) : CalendarCarousel<Event>(
          minSelectedDate: widget.today,
          selectedDayButtonColor: ThemeUtils.colorPurple,
          prevMonthDayBorderColor: Colors.transparent,
          markedDateIconBorderColor: Colors.transparent,
          selectedDayBorderColor: Colors.transparent,
          nextMonthDayBorderColor: Colors.transparent,
          dayButtonColor: Colors.transparent,
          todayBorderColor: Colors.transparent,
          todayButtonColor: Colors.transparent,
          selectedDayTextStyle: const TextStyle(color: Colors.white),
          onDayPressed: (DateTime date, List<Event> events) {
            if (date.isAfter(widget.today) || date == widget.today) {
              changeDateTime(date);
            }
          },
          weekendTextStyle: TextStyle(
            color: ThemeUtils.colorPurple,
          ),
          daysTextStyle: TextStyle(
            color: ThemeUtils.colorPurple,
          ),
          todayTextStyle: TextStyle(
            color: ThemeUtils.colorPurple,
          ),
          headerTextStyle: TextStyle(
            color: ThemeUtils.colorPurple,
            fontSize: 16,
          ),
          weekdayTextStyle: TextStyle(
            color: ThemeUtils.colorPurple,
            fontSize: 16,
          ),
          thisMonthDayBorderColor: Colors.transparent,
          customDayBuilder: (
            /// you can provide your own build function to make custom day containers
            bool isSelectable,
            int index,
            bool isSelectedDay,
            bool isToday,
            bool isPrevMonthDay,
            TextStyle textStyle,
            bool isNextMonthDay,
            bool isThisMonthDay,
            DateTime day,
          ) {
            if (beginDateTime == day) {
              final now = DateTime.now();
              final today = DateTime(now.year, now.month, now.day);
    
              if (today.isAfter(day)) {
                beginDateTime = null;
                return null;
              }
    
      
            } else {
              return null;
            }
          },
          weekFormat: false,
         
          selectedDateTime: beginDateTime,
          daysHaveCircularBorder: true,
        ),)
             
            ],
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: NormalButton(
            text: ("Done"),
            onTap: () async {
Get.back();
              return;
              var valor = _getValueText(
                config.calendarType,
                rangeDatePickerValueWithDefaultValue,
              );
              if (valor.contains("null")) {
                print("tiene null");
              } else {
                Get.back(/* result: {"day": valor} */);
              }
            },
            backgroundColor: ThemeUtils.colorPurple),
      ),
    );
  }

  void changeDateTime(DateTime date) {
    beginDateTime = date;
    setState(() {});
  }

  String _getValueText(
    CalendarDatePicker2Type datePickerType,
    List<DateTime?> values,
  ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
              .map((v) => v.toString().replaceAll('00:00:00.000', ''))
              .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate |  $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }
}
