import 'package:brokr/ui/guest/fragments/filter_map/widgets/calendar_page.dart';
import 'package:brokr/ui/bottom_sheets/geocoding_page.dart';
import 'package:brokr/ui/guest/fragments/filter_map/widgets/multi_calendar_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/appbar_widget.dart';


class FilterMapPage extends StatefulWidget {
  final String title;
  const FilterMapPage({super.key, required this.title});

  @override
  State<FilterMapPage> createState() => _FilterMapPageState();
}

class _FilterMapPageState extends State<FilterMapPage> {
  final TextEditingController pickLocation = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController pickHour = TextEditingController();
  final TextEditingController returnDate = TextEditingController();
  final TextEditingController returnHour = TextEditingController();

//  STAY
  final TextEditingController where = TextEditingController();
  final TextEditingController when = TextEditingController();
  final TextEditingController who = TextEditingController();

  //  STAY
  final TextEditingController hours = TextEditingController();
  final TextEditingController guest = TextEditingController();

  DateTime today = DateTime.now();

  String selectedValueHours = "1";
  String selectValueGuest = "1";

  @override
  void initState() {
    today = DateTime(today.year, today.month, today.day);

    if (widget.title == "Car") {
      pickLocation.text = "(MIA)Airport International - Fort Lauderdale";
      date.text = "2023-05-01";
      returnDate.text = "2023-05-01";
      pickHour.text = "10:00:00";
      returnHour.text = "10:00:00";
    }

    if (widget.title == "Stay") {
      where.text = "Bloomfield, New Jersey, EE. UU.";
      when.text = "2023-03-01 | 2023-03-09";
      who.text = "7 Adults, 1 infant, 4 children, 1 pet";
    }
    if (widget.title == "Yacth") {
      where.text = "Bloomfield, New Jersey, EE. UU.";
      when.text = "2023-03-01 | 2023-03-09";
      guest.text = "2";
      hours.text = "4";
    }
    if (widget.title == "Boat") {
      where.text = "Bloomfield, New Jersey, EE. UU.";
      when.text = "2023-03-01 | 2023-03-09";
      guest.text = "2";
      hours.text = "4";
    }
    super.initState();
  }

  void changedValueGuest(String guest) {
    selectValueGuest = guest;
    setState(() {});
  }

  void changedValueHours(String hours) {
    selectedValueHours = hours;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomBar(
          title: 'Search ${widget.title}',
          showLeading: true,
        ),
        body: Container(
          padding: EdgeInsets.all(Get.context!.width * 0.055),
          child: SingleChildScrollView(
            child: customContainer(widget.title),
          ),
        ));
  }

  Widget customContainer(
    String title,
  ) {
    if (title == "Car") {
      return Column(children: [
        GestureDetector(
          onTap: () async {
            var response = await Get.to( AddressGooglePlace(
              titleTextField: "Pickup and Return",
            ));
            if (response != null) {
              pickLocation.text = response["data"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: pickLocation,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.my_location),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Pickup and Return",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var response = await Get.to(CalendarPage(today: today));
                  print(response);
                  if (response != null) {
                    date.text = response["day"].toString().split(" ")[0];
                  }
                },
                child: TextField(
                  enabled: false,
                  controller: date,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    suffixIcon: const Icon(Icons.calendar_today_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Pickup Date",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var picked = await selectTime(context);
                  if (picked != null) {
                    final hour = picked.hourOfPeriod;
                    final minute = picked.minute;
                    final period = picked.period.toString().split(".")[1];
                    print(picked);
                    final zeros = minute < 10 ? '0' : '';
                    print('$hour:$zeros$minute $period');

                    pickHour.text = '$hour:$zeros$minute:00';
                  }
                },
                child: TextField(
                  enabled: false,
                  controller: pickHour,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    suffixIcon: const Icon(Icons.access_time_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Pickup Hour",
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var response = await Get.to(CalendarPage(today: today));
                  print(response);
                  if (response != null) {
                    returnDate.text = response["day"].toString().split(" ")[0];
                  }
                },
                child: TextField(
                  enabled: false,
                  controller: returnDate,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    suffixIcon: const Icon(Icons.calendar_today_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Return Date",
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var picked = await selectTime(context);
                  if (picked != null) {
                    final hour = picked.hourOfPeriod;
                    final minute = picked.minute;
                    final period = picked.period.toString().split(".")[1];
                    print(picked);
                    final zeros = minute < 10 ? '0' : '';
                    print('$hour:$zeros$minute $period');

                    returnHour.text = '$hour:$zeros$minute:00';
                  }
                },
                child: TextField(
                  enabled: false,
                  controller: returnHour,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    suffixIcon: const Icon(Icons.access_time_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Return Hour",
                  ),
                ),
              ),
            ),
          ],
        ),
      ]);
    }

    if (title == "Stay") {
      return Column(children: [
        GestureDetector(
          onTap: () async {
            var response = await Get.to( AddressGooglePlace(
              titleTextField: "Pickup Location",
            ));
            if (response != null) {
              where.text = response["data"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: where,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.my_location),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Where",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GestureDetector(
          onTap: () async {
            var response = await Get.to(MultiCalendarPage(today: today));

            if (response != null) {
              when.text = response["day"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: when,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "When",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GestureDetector(
          onTap: () async {
          /*   var response = await Get.to(GuessWidget());

            if (response != null) {
              who.text = response["data"] as String;
            } */
          },
          child: TextField(
            enabled: false,
            controller: who,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.people_alt_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Who",
            ),
          ),
        ),
      ]);
    }

    if (title == "Yacth") {
      return Column(children: [
        GestureDetector(
          onTap: () async {
           var response = await Get.to( AddressGooglePlace(
              titleTextField: "Pickup Location",
            ));
            if (response != null) {
              where.text = response["data"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: where,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.my_location),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Where",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GestureDetector(
          onTap: () async {
            var response = await Get.to(MultiCalendarPage(today: today));

            if (response != null) {
              when.text = response["day"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: when,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "When",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
                child: buildDropdownFormField(
                    selectedValueHours,
                    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                    "Hours",
                    changedValueHours)),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var picked = await selectTime(context);
                  if (picked != null) {
                    final hour = picked.hourOfPeriod;
                    final minute = picked.minute;
                    final period = picked.period.toString().split(".")[1];
                    print(picked);
                    final zeros = minute < 10 ? '0' : '';
                    print('$hour:$zeros$minute $period');

                    pickHour.text = '$hour:$zeros$minute:00';
                  }
                },
                child: TextField(
                  enabled: false,
                  controller: pickHour,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    suffixIcon: const Icon(Icons.access_time_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Start Time",
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        buildDropdownFormField(
            selectValueGuest,
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
            "Guest",
            changedValueGuest)
      ]);
    }

    if (title == "Boat") {
      return Column(children: [
        GestureDetector(
          onTap: () async {
          var response = await Get.to( AddressGooglePlace(
              titleTextField: "Pickup Location",
            ));
            if (response != null) {
              where.text = response["data"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: where,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.my_location),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "Where",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        GestureDetector(
          onTap: () async {
            var response = await Get.to(MultiCalendarPage(today: today));

            if (response != null) {
              when.text = response["day"] as String;
            }
          },
          child: TextField(
            enabled: false,
            controller: when,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  )),
              suffixIcon: const Icon(Icons.calendar_today_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              labelText: "When",
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            Expanded(
                child: buildDropdownFormField(
                    selectedValueHours,
                    ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
                    "Hours",
                    changedValueHours)),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () async {
                  var picked = await selectTime(context);
                  if (picked != null) {
                    final hour = picked.hourOfPeriod;
                    final minute = picked.minute;
                    final period = picked.period.toString().split(".")[1];
                    print(picked);
                    final zeros = minute < 10 ? '0' : '';
                    print('$hour:$zeros$minute $period');

                    pickHour.text = '$hour:$zeros$minute:00';
                  }
                },
                child: TextField(
                  enabled: false,
                  controller: pickHour,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        )),
                    suffixIcon: const Icon(Icons.access_time_rounded),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    labelText: "Start Time",
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
        buildDropdownFormField(
            selectValueGuest,
            ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
            "Guest",
            changedValueGuest)
      ]);
    }
    return Container();
  }

  Future<TimeOfDay?> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: const TimeOfDay(
        hour: 12,
        minute: 30,
      ),
    );

    return picked;
  }

  FormField<String> buildDropdownFormField(String selectedValue,
      List<String> dropdownItems, String labelText, Function onChanged) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return SizedBox(
          height: 60,
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: labelText,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: selectedValue,
                items: dropdownItems.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  onChanged(newValue);
                },
              ),
            ),
          ),
        );
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Este campo es obligatorio';
        }
        return null;
      },
    );
  }
}
