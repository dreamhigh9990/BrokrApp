import 'package:flutter/material.dart';

import '../../utils/responsive.dart';
import '../../themes/main_theme.dart';
import '../../themes/colors_theme.dart';
import '../../services/pool.services.dart';
import '../../themes/font_size_themes.dart';
import '../../../locator_services/locator_services.dart';

export 'package:flutter/material.dart';

abstract class StatelessCustom extends StatelessWidget {
  
  @override
  // ignore: overridden_fields
  final Key? key;
  final TextTheme _textTheme;
  final MainTheme _mainTheme;
  final Responsive _responsive;
  final ColorsTheme _colorsTheme;
  final FontSizeThemes _fontSizeThemes;

  StatelessCustom({
    this.key,
  })  : _responsive = LocatorServices.I<PoolServices>().mainTheme.responsive,
        _fontSizeThemes = LocatorServices.I<PoolServices>().mainTheme.fontSize,
        _colorsTheme = LocatorServices.I<PoolServices>().mainTheme.colorsTheme,
        _mainTheme = LocatorServices.I<PoolServices>().mainTheme,
        _textTheme =
            LocatorServices.I<PoolServices>().mainTheme.fontSize.getTextTheme,
        super(
          key: key,
        );

  TextTheme get textTheme => _textTheme;
  Responsive get responsive => _responsive;
  ColorsTheme get colorsTheme => _colorsTheme;
  FontSizeThemes get fontSize => _fontSizeThemes;
  MainTheme get generalThemes => _mainTheme;
}
