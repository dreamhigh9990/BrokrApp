import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class NumberListWidget extends StatefulWidget {
  const NumberListWidget({super.key});

  @override
  State<NumberListWidget> createState() => _NumberListWidgetState();
}

class _NumberListWidgetState extends State<NumberListWidget> {
  List<ListNumberModel> list = [];
  late ListNumberModel anterior;

  @override
  void initState() {
    for (int i = 1; i <= 12; i++) {
      list.add(ListNumberModel(title: i.toString(), value: false));
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
        return MaterialButton(
          elevation: 0.0,
          color: list[index].value
              ? ThemeUtils.colorPurple.withOpacity(0.2)
              : Colors.white,
          height: 50,
          minWidth: 25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color:
                    list[index].value ? ThemeUtils.colorPurple : Colors.grey),
          ),
          /*   style: ButtonStyle(
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
                  list[index].value ? ThemeUtils.colorPurple.withOpacity(0.2) : Colors.white)), */
          onPressed: () {
            updateHour(index);
            setState(() {});
          },
          child: Text(
            list[index].title,
            style: TextStyle(
                fontSize: 14,
                fontFamily: ThemeUtils.interRegular,
                color: Colors.black),
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

class ListNumberModel {
  final String title;
  bool value;

  ListNumberModel({required this.title, required this.value});
}
