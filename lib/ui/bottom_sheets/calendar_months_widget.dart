// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/theme_utils.dart';

import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class DatePickerCustom extends StatefulWidget {
  final bool singleSelection;
  final Function callback;
  DateTime? start;
  DateTime? end;

  DatePickerCustom({
    super.key,
    required this.callback,
    required this.singleSelection,
    this.start,
    this.end,
  });

  @override
  _DatePickerCustomState createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  static DateTime now = DateTime.now();
  final firstDayOfYear = DateTime(now.year, 1, 1);
  final lastDayOfYear = DateTime(now.year, 12, 31);
  DateFormat formatter = DateFormat('dd/MM/yyyy');

  bool isInRange(DateTime date) {
    if (widget.start == null) return false;

    if (widget.end == null) return date == widget.start;

    return ((date == widget.start || date.isAfter(widget.start!)) &&
        (date == widget.end || date.isBefore(widget.end!)));
  }

  @override
  Widget build(BuildContext context) {
    return PagedVerticalCalendar(
      listPadding: EdgeInsets.zero,
      minDate: firstDayOfYear,
      maxDate: lastDayOfYear,
      addAutomaticKeepAlives: true,
      dayBuilder: (context, date) {
        final bool isStart =
            widget.start != null && date.isAtSameMomentAs(widget.start!);
        final bool isEnd =
            widget.end != null && date.isAtSameMomentAs(widget.end!);
        final bool isSelected = isStart || isEnd || isInRange(date);

        Color color = Colors.transparent;
        if (isSelected) {
          color = isStart
              ? ThemeUtils.colorPurple
              : isEnd
                  ? ThemeUtils.colorPurple
                  : const Color(0xFFF1F2FF);
        }
        return Container(
          height: 20,
          width: 20.0,
          decoration: BoxDecoration(
              color: color,
              borderRadius: widget.singleSelection == false
                  ? BorderRadius.only(
                      topLeft: isStart
                          ? const Radius.circular(15)
                          : const Radius.circular(0),
                      bottomLeft: isStart
                          ? const Radius.circular(15)
                          : const Radius.circular(0),
                      topRight: isEnd
                          ? const Radius.circular(15)
                          : const Radius.circular(0),
                      bottomRight: isEnd
                          ? const Radius.circular(15)
                          : const Radius.circular(0),
                    )
                  : BorderRadius.circular(15.0)),
          child: Center(
            child: Text(
              DateFormat('d').format(date),
              style: TextStyle(
                color: isStart || isEnd == true ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
      monthBuilder: (context, month, year) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.all(10),
              child: Text(DateFormat('MMMM yyyy').format(DateTime(year, month)),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  weekText('Su'),
                  weekText('Mo'),
                  weekText('Tu'),
                  weekText('We'),
                  weekText('Th'),
                  weekText('Fr'),
                  weekText('Sa'),
                ],
              ),
            ),
          ],
        );
      },
      onDayPressed: (DateTime date) {
        setState(() {
          if (widget.singleSelection) {
            widget.start = date;
            widget.end = null;
          } else {
            if (widget.start == null) {
              widget.start = date;
            } else if (widget.end == null) {
              widget.end = date;
              if (date.isAfter(widget.start!) == false) {
                widget.start = date;
                widget.end = null;
              }
            } else {
              widget.start = date;
              widget.end = null;
            }
          }
        });

        if (widget.start != null && widget.end != null) {
          widget.callback(formatter.format(widget.start!),
              formatter.format(widget.end!), widget.start, widget.end);
        }
      },
    );
  }

  Widget weekText(String text) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
    );
  }
}
