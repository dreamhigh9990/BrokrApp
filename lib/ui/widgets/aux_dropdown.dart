import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterFlowDropDown<T> extends StatefulWidget {
  FlutterFlowDropDown({
    super.key,
    this.initialOption,
    this.hintText,
    required this.options,
    this.optionLabels,
    required this.onChanged,
    this.icon,
    this.width,
    this.height,
    required this.dropDownStyleText,
    this.fillColor,
    this.dropdownColor,
    required this.textStyle,
    required this.elevation,
    required this.borderWidth,
    required this.borderRadius,
    required this.borderColor,
    required this.margin,
    this.hidesUnderline = false,
    this.disabled = false,
  });

  T? initialOption;
  final String? hintText;
  final List<T> options;
  final List<String>? optionLabels;
  final Function(T?) onChanged;
  final Widget? icon;
  final double? width;
  final double? height;
  final Color? fillColor;
  final Color? dropdownColor;
  final TextStyle textStyle;
  final TextStyle dropDownStyleText;
  final double elevation;
  final double borderWidth;
  final double borderRadius;
  final Color borderColor;
  final EdgeInsetsGeometry margin;
  final bool hidesUnderline;
  final bool disabled;

  @override
  State<FlutterFlowDropDown<T>> createState() => _FlutterFlowDropDownState<T>();
}

class _FlutterFlowDropDownState<T> extends State<FlutterFlowDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    final dropdownWidget = Container(
      child: DropdownButton<T>(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        menuMaxHeight: 300,
        value: widget.initialOption,
        hint: Text(widget.hintText!.capitalizeFirst!, style: widget.textStyle),
        items: widget.options
            .asMap()
            .entries
            .map(
              (option) => DropdownMenuItem<T>(
                value: option.value,
                child: Text(
                  option.value.toString(),
                  style: widget.dropDownStyleText,
                ),
              ),
            )
            .toList(),
        elevation: widget.elevation.toInt(),
        onChanged: (value) {
          widget.initialOption = value;
          widget.onChanged(value);
        },
        icon: widget.icon,
        isExpanded: true,
        dropdownColor: widget.dropdownColor,
        focusColor: Colors.transparent,
      ),
    );
    final childWidget = DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        border: Border.all(
          color: widget.borderColor,
          width: widget.borderWidth,
        ),
        color: widget.fillColor,
      ),
      child: Padding(
        padding: widget.margin,
        child: widget.hidesUnderline
            ? DropdownButtonHideUnderline(child: dropdownWidget)
            : dropdownWidget,
      ),
    );
    if (widget.height != null || widget.width != null) {
      return SizedBox(
        width: widget.width,
        height: widget.height,
        child: childWidget,
      );
    }
    return childWidget;
  }
}
