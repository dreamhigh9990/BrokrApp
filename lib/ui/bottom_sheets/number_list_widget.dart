import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

class NumberListWidget extends StatefulWidget {
     List<ListNumberModel>? list;
   NumberListWidget({super.key, this.list});

  @override
  State<NumberListWidget> createState() => _NumberListWidgetState();
}

class _NumberListWidgetState extends State<NumberListWidget> {



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount:  widget.list!.length,
      itemBuilder: (BuildContext context, int index) {
        return MaterialButton(
          elevation: 0.0,
          color:  widget.list![index].value
              ? ThemeUtils.colorPurple.withOpacity(0.2)
              : Colors.white,
          height: 50,
          minWidth: 25,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color:
                     widget.list![index].value ? ThemeUtils.colorPurple : Colors.grey),
          ),
         
          onPressed: () {
            updateHour(index);
            setState(() {});
          },
          child: Text(
             widget.list![index].title,
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
    for (int i = 0; i < widget.list!.length; i++) {
      if (i == index) {
        widget.list![i].value = true;
      } else {
         widget.list![i].value = false;
      }
    }
  }
}

class ListNumberModel {
  final String title;
  bool value;

  ListNumberModel({required this.title, required this.value});

  static List<ListNumberModel> createList() {
    List<ListNumberModel> list = [];
    for (int i = 1; i <= 12; i++) {
      list.add(ListNumberModel(title: i.toString(), value: false));
    }
    return list;
  }
}
