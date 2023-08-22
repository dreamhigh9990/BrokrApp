// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'icon_radio_button.dart';

class ListCardsItemsWidget extends StatefulWidget {
  int groupValue = 0;
  final Function function;
  ListCardsItemsWidget({
    super.key,
    required this.groupValue,
    required this.function,
  });

  @override
  State<ListCardsItemsWidget> createState() => _ListCardsItemsWidgetState();
}

class _ListCardsItemsWidgetState extends State<ListCardsItemsWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 5;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0XFFEBEBEB),
      ),
      padding: EdgeInsets.only(
          top: 3.5,
          bottom: 3.5,
          left: Get.context!.width * 0.015,
          right: Get.context!.width * 0.015),
      margin: EdgeInsets.only(
          left: Get.context!.width * 0.05, right: Get.context!.width * 0.05),
      child: Row(
        children: [
          SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 2.5,
              child: IconRadioButton2(
                iconPath: 'assets/icons/car_icon.svg',
                text: 'Car',
                value: 0,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  widget.function(value);
                },
                borderColor: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 2.5,
              child: IconRadioButton2(
                 width: 22.5,
                iconPath: 'assets/icons/house_icon.svg',
                text: 'Stay',
                value: 1,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  widget.function(value);
                },
                borderColor: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 2.5,
              child: IconRadioButton2(
                iconPath: 'assets/icons/yacht_icon.svg',
                text: 'Yacht',
                value: 2,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  widget.function(value);
                },
                borderColor: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          SizedBox(
            width: width,
            child: AspectRatio(
              aspectRatio: 2.5,
              child: IconRadioButton2(
                iconPath: 'assets/icons/boat_icon.svg',
                text: 'Boat',
                value: 3,
                groupValue: widget.groupValue,
                onChanged: (value) {
                  widget.function(value);
                },
                borderColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
