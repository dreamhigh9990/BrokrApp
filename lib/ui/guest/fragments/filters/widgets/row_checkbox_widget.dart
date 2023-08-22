import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/theme_utils.dart';

class RowCheckBoxWidget extends StatefulWidget {
  final bool value;
  final String title;

  final Function(bool val) function;
  const RowCheckBoxWidget({
    super.key,
    required this.title,
    required this.value,
    required this.function,
  });

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
            value: widget.value,
            activeTrackColor: ThemeUtils.colorSwitch,
            activeColor: ThemeUtils.colorPurple,
            inactiveTrackColor: ThemeUtils.colorOffSwitch,
            inactiveThumbColor: Colors.white,
            onChanged: (bool locale) {
              widget.function(locale);
            })
      ],
    );
  }
}
