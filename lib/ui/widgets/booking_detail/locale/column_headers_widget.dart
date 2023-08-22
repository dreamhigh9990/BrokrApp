// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/theme_utils.dart';
import '../../../bottom_sheets/hours_list_widget.dart';
import '../../text_align_left_widget.dart';

class ColumnHeadersWidget extends StatefulWidget {
  final String title;
  final String svg;
  String content;
  final bool isShowChange;
  bool? textCenter;
  Function? callback;
  ColumnHeadersWidget({
    super.key,
    required this.title,
    required this.svg,
    required this.content,
    required this.isShowChange,
    this.textCenter = false,
    this.callback,
  });

  @override
  State<ColumnHeadersWidget> createState() => _ColumnHeadersWidgetState();
}

class _ColumnHeadersWidgetState extends State<ColumnHeadersWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      // margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 7.5),
          TextAlignLeft(title: widget.title),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              widget.callback!();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/${widget.svg}.svg"),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    // color: Colors.red,
                    child: Text(
                      widget.content,
                      style: TextStyle(
                          color: const Color(0xFF505050), fontSize: 12.sp),
                    ),
                  ),
                ),
                const Spacer(),
                if (widget.isShowChange)
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  )
              ],
            ),
          ),
           const SizedBox(
            height: 15.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}

class DatesColumnHeadersWidget extends StatefulWidget {
  final String pickupDate;
  final String returnDate;
  final HourModel firstHour;
  final HourModel secondHour;
  final String title;
  final String svg;

  Function? callback;
  DatesColumnHeadersWidget({
    super.key,
    required this.title,
    required this.svg,
    this.callback,
    required this.pickupDate,
    required this.returnDate,
    required this.firstHour,
    required this.secondHour,
  });

  @override
  State<DatesColumnHeadersWidget> createState() =>
      _DatesColumnHeadersWidgetState();
}

class _DatesColumnHeadersWidgetState extends State<DatesColumnHeadersWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //color: Colors.red,
      // margin: const EdgeInsets.only(bottom: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
            const SizedBox(height: 7.5),
          TextAlignLeft(title: widget.title),
          const SizedBox(height: 12),
          InkWell(
            onTap: () {
              widget.callback!();
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/${widget.svg}.svg"),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pick-up date",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${widget.pickupDate} , ${widget.firstHour.title}",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF505050),
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                const Spacer(),
                Container(
                  height: 10.0,
                  width: 1.0,
                  color: Colors.grey,
                ),
                const Spacer(),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Return date",
                        style: TextStyle(fontSize: 10.sp),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "${widget.returnDate} , ${widget.secondHour.title}",
                        style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xFF505050),
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
