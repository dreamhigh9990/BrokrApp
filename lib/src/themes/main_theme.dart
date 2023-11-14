import 'package:flutter/material.dart';

import 'font_size_themes.dart';
import '../utils/responsive.dart';
import '../themes/colors_theme.dart';

class MainTheme {
  late Responsive _responsive;
  late ThemeData _currentTheme;
  late ColorsTheme _colorsTheme;
  late FontSizeThemes _fontSizeThemes;

  ThemeData get currentTheme => _currentTheme;
  Responsive get responsive => _responsive;
  ColorsTheme get colorsTheme => _colorsTheme;
  FontSizeThemes get fontSize => _fontSizeThemes;

  // ignore: type_annotate_public_apis
  initialize() async {
    _responsive = Responsive();
    _colorsTheme = ColorsTheme()..setColors();
    _fontSizeThemes = FontSizeThemes(
      responsive: _responsive,
      normalColor: colorsTheme.textPrimary,
    );

    _currentTheme = ThemeData(
      scaffoldBackgroundColor: _colorsTheme.surface,
      appBarTheme: AppBarTheme(
        color: _colorsTheme.primary,
        iconTheme: IconThemeData(
          color: _colorsTheme.primaryVariant,
        ),
      ),
      colorScheme: ColorScheme.light(
        error: _colorsTheme.error,
        primary: _colorsTheme.primary,
        surface: _colorsTheme.surface,
        onSurface: colorsTheme.surfaceVariant,
      ),
      textTheme: _fontSizeThemes.getTextTheme,
    );
  }
}
