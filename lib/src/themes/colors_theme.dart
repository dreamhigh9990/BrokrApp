import 'package:flutter/material.dart';

class ColorsTheme {
  late Color _error;
  late Color _surface;
  late Color _primary;
  late Color _secondary;
  late Color _textPrimary;
  late Color _surfaceVariant;
  late Color _primaryVariant;
  late Color _secondaryVariant;
  late Color _textOpacity;

  Color get error => _error;
  Color get surface => _surface;
  Color get primary => _primary;
  Color get textPrimary => _textPrimary;
  Color get secondary => _secondary;
  Color get surfaceVariant => _surfaceVariant;
  Color get primaryVariant => _primaryVariant;
  Color get secondaryVariant => _secondaryVariant;
  Color get textOpacity => _textOpacity;

  LinearGradient get gradientPrimary => LinearGradient(
      colors: [primary, secondary],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  void setColors() {
    _error = Colors.red;
    _surface = Colors.white;
    // _primary = const Color(0xff8B2FE0);
    // _secondary = const Color(0xff508FF7);
    _primary = const Color(0xff675DFE);
    _secondary = const Color(0xff675DFE);
    _surfaceVariant = Colors.black;
    _textPrimary = const Color(0xff848484);
    _primaryVariant = const Color(0xff4DDD88);
    _textOpacity = const Color(0xffAAAAAA);
  }
}
