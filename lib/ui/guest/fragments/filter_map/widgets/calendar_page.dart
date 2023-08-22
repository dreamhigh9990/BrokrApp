// ignore_for_file: must_be_immutable

import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/appbar_widget.dart';

class CalendarPage extends StatefulWidget {
  final DateTime today;

  const CalendarPage({super.key, required this.today});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime? beginDateTime;

  DateTime? endDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomBar(title: "Calendar", showLeading: true),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: CalendarCarousel<Event>(
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
        ),
      ),
   bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(20.0),
     child: NormalButton(text: ("Done"), onTap: (){
      print(beginDateTime); 
        Get.back(
        /* result:  {"day":beginDateTime} */
      ); 
     }, backgroundColor: ThemeUtils.colorPurple),
   ),
   
    );
  }

  void changeDateTime(DateTime date) {
    beginDateTime = date;
    setState(() {
      
    });
  }
}
