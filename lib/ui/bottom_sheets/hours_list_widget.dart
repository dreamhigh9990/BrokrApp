import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class HoursListWidget extends StatefulWidget {

  List<HourModel> list;
  Function? onchanged;
  HoursListWidget({super.key, this.onchanged, required this.list});

  @override
  State<HoursListWidget> createState() => _HoursListWidgetState();
}

class _HoursListWidgetState extends State<HoursListWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                elevation: const MaterialStatePropertyAll(0.0),
                side: MaterialStatePropertyAll(BorderSide(
                    color: widget.list[index].value
                        ? ThemeUtils.colorPurple
                        : Colors.grey)),
                backgroundColor: MaterialStatePropertyAll(widget.list[index].value
                    ? ThemeUtils.colorPurple.withOpacity(0.2)
                    : Colors.white)),
            onPressed: () {
              widget.onchanged!(widget.list[index]);
              updateHour(
                index,
              );
              setState(() {});
            },
            child: Text(
              widget.list[index].title,
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: ThemeUtils.interRegular,
                  color: Colors.black),
            ),
          ),
        );
      },
    );
  }

  void updateHour(
    int index,
  ) {
    for (int i = 0; i < widget.list.length; i++) {
      if (i == index) {
        widget.list[i].value = true;
      } else {
        widget.list[i].value = false;
      }
    }
  }
}

class HourModel {
  final String title;
  bool value;

  HourModel({required this.title, required this.value});

   static List<HourModel> createList() {
    List<HourModel> list = [];
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

    return list;
  }
}
