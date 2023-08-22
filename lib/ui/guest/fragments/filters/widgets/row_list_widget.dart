import 'package:flutter/material.dart';
import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';

class CustomRowWidget extends StatefulWidget {
  final Function refresh;
  final List<String> options;
  final String title;
  final String hintText;
  const CustomRowWidget(
      {super.key,
      required this.title,
      required this.hintText,
      required this.options,
      required this.refresh});

  @override
  State<CustomRowWidget> createState() => _CustomRowWidgetState();
}

class _CustomRowWidgetState extends State<CustomRowWidget> {
  TextStyle styleTitle = TextStyle(fontSize: 14, color: ThemeUtils.titleFilter);
  TextStyle dropDownStyle = const TextStyle(
      fontSize: 12,
      color: Color(0xFF505050),
      fontWeight: FontWeight.normal,
      letterSpacing: 0.5);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        List<String> values = widget.options;
        var response = await GuestBottomSheests.showCupertinoCustom(
            GuestBottomSheests.listCupertinoDialog(values, widget.hintText,
                title: widget.title));
        if (response != null) {
          print(response);
          String res = response["response"] as String;
          widget.refresh(res);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            widget.title,
            style: styleTitle,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xFFEFEFF0),
            ),
            height: 36,
            width: 120,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.hintText,
                    style: dropDownStyle,
                  ),
                  const Icon(Icons.keyboard_arrow_down_rounded)
                ]),
          ),
        ],
      ),
    );
  }
}




/*    */