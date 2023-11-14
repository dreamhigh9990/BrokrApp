import 'package:flutter/material.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/aux_dropdown.dart';

class CustomRowWidget extends StatefulWidget {
  final String title;
  final String hintText;
  const CustomRowWidget(
      {super.key, required this.title, required this.hintText});

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
  String? dropDownValue1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          widget.title,
          style: styleTitle,
        ),
        const Spacer(),
        FlutterFlowDropDown<String>(
          options: const ['Option 1'],
          onChanged: (val) => setState(() => dropDownValue1 = val),
          width: 120,
          height: 36,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          textStyle: dropDownStyle,
          hintText: widget.hintText,
          fillColor: const Color(0xFFEFEFF0),
          elevation: 2,
          borderColor: Colors.transparent,
          borderWidth: 0,
          borderRadius: 18,
          margin: const EdgeInsetsDirectional.fromSTEB(20, 4, 8, 4),
          hidesUnderline: true,
        ),
      ],
    );
  }
}
