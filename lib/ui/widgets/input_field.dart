import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/theme_utils.dart';

class InputField extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Color enabledColor;
  final Color? focusedColor;
  final Color? focusedBorderColor;
  final Color? enabledBorderColor;
  final Color? disableBorderColor;
  final Color? hintColor;
  final Color? labelColor;
  final Color? textColor;
  final Color? iconColor;
  final Color? fillColor;
  final bool? enabled;
  final bool? filled;
  final List<TextInputFormatter>? formatters;
  final TextCapitalization? textCapitalization;
  final double cornersValue;
  final double width;
  final double? height;
  final FocusNode? focusNode;

  const InputField({
    Key? key,
    this.padding,
    this.margin = const EdgeInsets.all(0),
    this.onChanged,
    this.onSaved,
    this.validator,
    this.keyboardType,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.hintText,
    this.controller,
    this.obscureText = false,
    this.enabledColor = Colors.black,
    this.focusedColor,
    this.focusedBorderColor,
    this.enabledBorderColor,
    this.disableBorderColor,
    this.hintColor,
    this.labelColor,
    this.textColor,
    this.enabled,
    this.formatters,
    this.textCapitalization,
    this.cornersValue = 5,
    this.width = double.infinity,
    this.focusNode,
    this.iconColor,
    this.fillColor,
    this.height = 50,
    this.filled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      height: height,
      width: width,
      child: TextFormField(
        enabled: enabled,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        obscureText: obscureText,
        inputFormatters: formatters,
        focusNode: focusNode,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        style: TextStyle(
          color: textColor ?? enabledColor,
        ),
        decoration: InputDecoration(
          icon: icon,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          hoverColor: Colors.transparent,
          fillColor: fillColor ?? Colors.transparent,
          filled: filled,
          labelStyle: TextStyle(
            color: labelColor ?? ThemeUtils.inputBorderColor,
          ),
          hintStyle: TextStyle(
            color: hintColor ?? ThemeUtils.inputBorderColor,
          ),
          hintText: hintText,
        
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: BorderSide(
              color: enabledBorderColor ?? ThemeUtils.inputBorderColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: BorderSide(
              color: disableBorderColor ?? ThemeUtils.inputBorderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: BorderSide(
              color: focusedBorderColor ?? ThemeUtils.inputFocusedColor,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class TextAreaField extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final String? hintText;
  final TextEditingController? controller;
  final Color enabledColor;
  final Color? focusedColor;
  final Color? textColor;
  final Color? fillColor;
  final bool? enabled;
  final bool? filled;
  final List<TextInputFormatter>? formatters;
  final TextCapitalization? textCapitalization;
  final double cornersValue;
  final double width;
  final double height;
  final FocusNode? focusNode;
  final int? maxLength;

  const TextAreaField({
    Key? key,
    this.padding,
    this.margin = const EdgeInsets.all(0),
    this.onChanged,
    this.onSaved,
    this.validator,
    this.keyboardType = TextInputType.multiline,
    this.hintText,
    this.controller,
    this.enabledColor = Colors.black,
    this.focusedColor,
    this.textColor,
    this.enabled,
    this.formatters,
    this.textCapitalization,
    this.cornersValue = 5,
    this.width = double.infinity,
    this.height = 100,
    this.focusNode,
    this.fillColor,
    this.filled,
    this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      child: TextFormField(
        enabled: enabled,
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        validator: validator,
        inputFormatters: formatters,
        focusNode: focusNode,
        maxLines: null,
        minLines: 6,
        maxLength: maxLength,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        style: TextStyle(
          color: textColor ?? enabledColor,
        ),
        decoration: InputDecoration(
          hoverColor: Colors.transparent,
          fillColor: fillColor ?? Colors.transparent,
          filled: filled,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: BorderSide(
              color: ThemeUtils.inputBorderColor,
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: BorderSide(
              color: ThemeUtils.inputBorderColor,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: BorderSide(
              color: ThemeUtils.inputFocusedColor,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(cornersValue)),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
