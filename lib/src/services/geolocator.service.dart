import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  bool _havePermission = false;
  late Position currentPosition;

  get havePermission => _havePermission;

  init() async {
    if (await serviceEnabled()) {
      _havePermission = await isAllowed();
      if (_havePermission) {
        final position = await Geolocator.getCurrentPosition();
        currentPosition = position;
      }
    }
  }

  Future<bool> serviceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<bool> isAllowed() async {
    final LocationPermission permission = await Geolocator.checkPermission();
    if (![LocationPermission.deniedForever, LocationPermission.denied]
        .contains(permission)) {
      _havePermission = true;
      return true;
    }
    return false;
  }

  Future<bool> requestPermission() async {
    final LocationPermission permission = await Geolocator.requestPermission();
    if (![LocationPermission.deniedForever, LocationPermission.denied]
        .contains(permission)) {
      _havePermission = true;
      await init();
      return true;
    }
    return false;
  }
}
