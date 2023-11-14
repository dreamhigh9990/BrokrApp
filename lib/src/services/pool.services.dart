import 'package:brokr/src/services/geolocator.service.dart';

import '../themes/main_theme.dart';

class PoolServices {
  final MainTheme mainTheme;
  final GeolocatorService geolocatorService;

  PoolServices({
    required this.mainTheme,
    required this.geolocatorService,
  });

  static Future<PoolServices> initialize() async {
    final mainTheme = MainTheme()..initialize();
    final geolocator = GeolocatorService()..init();

    return PoolServices(
      mainTheme: mainTheme,
      geolocatorService: geolocator,
    );
  }
}
