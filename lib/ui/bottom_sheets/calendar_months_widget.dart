// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:brokr/ui/bottom_sheets/bottom_sheets_guest.dart';
import 'package:brokr/ui/bottom_sheets/hours_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/theme_utils.dart';
import '../widgets/normal_button.dart';
import 'widgets/header_bar_widget.dart';
import 'package:intl/intl.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class CalendarMonthsPage extends StatefulWidget {
  CalendarMonthsPage({
    super.key,
  });

  @override
  State<CalendarMonthsPage> createState() => _CalendarMonthsPageState();
}

class _CalendarMonthsPageState extends State<CalendarMonthsPage> {
  final int currentYear = DateTime.now().year;

  TextEditingController pickText = TextEditingController();
  TextEditingController returnText = TextEditingController();

  @override
  void initState() {
    pickText.text = "Pick-up  11/22/23";
    returnText.text = "Return  11/25/23";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.context!.height,
        width: double.infinity,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(0.0),
          children: [
            const HeaderBarWidget(title: "When?"),
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
              height: Get.context!.height * 0.60,
              child: DatePickerCustom(),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: Get.context!.width * 0.05,
                  right: Get.context!.width * 0.05,
                  top: 10.0,
                  bottom: 10.0),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Select times',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      height: 60,
                      width: Get.context!.width,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                              child: InputDecorator(
                            decoration: ThemeUtils.inputDecoration(
                                isPadding: ThemeUtils.paddingLeftAndRight,
                                labelText: "Pick-up | 11/22/23"),
                            child: ListTile(
                              onTap: () async {
                                var response =
                                    await GuestBottomSheests.buildBottomSheet(
                          //              padding: const EdgeInsets.all(0.0),
                                        color: const Color(0XFFF2F2F2),
                                        context: context,
                                        child: HoursListWidget(),
                                        height: Get.context!.height);
                              },
                              minLeadingWidth: 0.0,
                              minVerticalPadding: 0.0,
                              contentPadding: const EdgeInsets.all(0.0),
                              title: const Text(
                                "Nov 22/23",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              leading: SvgPicture.asset(
                                "assets/icons/clock.svg",
                                height: Get.context!.height * 0.035,
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: InputDecorator(
                            decoration: ThemeUtils.inputDecoration(
                                isPadding: const EdgeInsets.only(
                                    left: 20.0, right: 20.0),
                                labelText: "Return | 11/25/23"),
                            child: ListTile(
                              onTap: () async {
                                var response =
                                    await Get.to(const HoursListWidget());
                              },
                              minLeadingWidth: 0.0,
                              minVerticalPadding: 0.0,
                              contentPadding: const EdgeInsets.all(0.0),
                              title: const Text(
                                "Nov 22/23",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              leading: SvgPicture.asset(
                                "assets/icons/clock.svg",
                                height: Get.context!.height * 0.035,
                              ),
                            ),
                          )),
                        ],
                      )),
                  const SizedBox(
                    height: 10.0,
                  ),
                  NormalButton(
                    backgroundColor: ThemeUtils.colorPurple,
                    text: 'Search',
                    onTap: () {},
                    cornersRadius: 8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({super.key});

  @override
  _DatePickerCustomState createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  /// store the selected start and end dates
  ///
  static DateTime now = DateTime.now();
  final firstDayOfYear = DateTime(now.year, 1, 1);
  final lastDayOfYear = DateTime(now.year, 12, 31);

  DateTime? start;
  DateTime? end;

  /// method to check wether a day is in the selected range
  /// used for highlighting those day
  bool isInRange(DateTime date) {
    // if start is null, no date has been selected yet
    if (start == null) return false;
    // if only end is null only the start should be highlighted
    if (end == null) return date == start;
    // if both start and end aren't null check if date false in the range
    return ((date == start || date.isAfter(start!)) &&
        (date == end || date.isBefore(end!)));
  }

  @override
  Widget build(BuildContext context) {
    return PagedVerticalCalendar(
      listPadding: const EdgeInsets.all(0.0),
      minDate: firstDayOfYear,
      maxDate: lastDayOfYear,
      addAutomaticKeepAlives: true,
      dayBuilder: (context, date) {
        final color =
            isInRange(date) ? ThemeUtils.colorPurple : Colors.transparent;

        return Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: Center(
            child: Text(
              DateFormat('d').format(date),
              style: TextStyle(
                color: isInRange(date) ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
      monthBuilder: (context, month, year) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              margin: const EdgeInsets.all(20),
              child: Text(DateFormat('MMMM yyyy').format(DateTime(year, month)),
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
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
      onDayPressed: (date) {
        setState(() {
          if (start == null)
            start = date;
          else if (end == null)
            end = date;
          else {
            print('selected range from $start to $end');
            start = null;
            end = null;
          }
        });
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
