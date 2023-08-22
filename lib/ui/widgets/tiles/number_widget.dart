import 'package:flutter/material.dart';

import '../../../utils/theme_utils.dart';

class NumberWidgetModel extends StatelessWidget {
  final Function function;
  final int index;
  final String title;
  bool pressed = false;
  NumberWidgetModel(
      {Key? key,
      this.pressed = false,
      required this.function,
      required this.index,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        function();
      },
      child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 10, right: 5),
          width: index == 0 ? 49 : 33,
          height: 41,
          decoration: BoxDecoration(
              color: pressed == false
                  ? Colors.white
                  : ThemeUtils.colorPurple.withOpacity(0.25),
              border: Border.all(
                color: pressed == false
                    ? const Color(0xFFEDECED)
                    : ThemeUtils.colorPurple,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            title,
            style: const TextStyle(fontSize: 12),
          )),
    );
  }
}
