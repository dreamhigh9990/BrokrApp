import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/theme_utils.dart';

class RowCheckBoxWidget extends StatefulWidget {
  final String title;
  const RowCheckBoxWidget({super.key, required this.title});

  @override
  State<RowCheckBoxWidget> createState() => _RowCheckBoxWidgetState();
}

class _RowCheckBoxWidgetState extends State<RowCheckBoxWidget> {
    TextStyle styleTitle = TextStyle(fontSize: 14, color: ThemeUtils.titleFilter);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AutoSizeText(widget.title, style: styleTitle),
        const Spacer(),
        Switch(
          value: true,
          trackColor: MaterialStatePropertyAll<Color>(ThemeUtils.colorSwitch),
          thumbColor: MaterialStatePropertyAll<Color>(ThemeUtils.colorPurple),
          onChanged: (bool value) {
            // This is called when the user toggles the switch.
            setState(() {});
          },
        )
      ],
    );
  }
}
