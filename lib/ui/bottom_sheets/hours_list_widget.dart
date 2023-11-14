import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class HoursListWidget extends StatefulWidget {
  const HoursListWidget({super.key});

  @override
  State<HoursListWidget> createState() => _HoursListWidgetState();
}

class _HoursListWidgetState extends State<HoursListWidget> {
  List<HourModel> list = [];
  late HourModel anterior;

  @override
  void initState() {
    for (int i = 0; i <= 18; i++) {
      int hour = (i ~/ 2) + 8;
      final minute = i % 2 == 0 ? '00' : '30';
      String period = 'AM';

      if (hour >= 12) {
        period = 'PM';
        if (hour > 12) {
          hour -= 12;
        }
      }
      list.add(HourModel(title: '$hour:$minute $period', value: false));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(left: 5.0,right: 5.0),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                elevation: const MaterialStatePropertyAll(0.0),
                side:  MaterialStatePropertyAll(BorderSide(
                  color:      list[index].value ? ThemeUtils.colorPurple : Colors.grey
                  
                )),
                backgroundColor: MaterialStatePropertyAll(
                    list[index].value ? ThemeUtils.colorPurple.withOpacity(0.2) : Colors.white)),
            onPressed: () {
              updateHour(index);
              setState(() {});
            },
            child: Text(
              list[index].title,
              style: TextStyle(
                  fontSize:  14,
                  fontFamily: ThemeUtils.interRegular,
                  color:  Colors.black),
            ),
          ),
        );
      },
    );
  }

  void updateHour(int index) {
    for (int i = 0; i < list.length; i++) {
      if (i == index) {
        list[i].value = true;
      } else {
        list[i].value = false;
      }
    }
  }
}

class HourModel {
  final String title;
  bool value;

  HourModel({required this.title, required this.value});
}
