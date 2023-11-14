import 'dart:math' as math;
import 'dart:ui';

class Responsive {
  late double _width, _height, _inch;

  Responsive() {
    _width = window.physicalSize.width / window.devicePixelRatio;
    _height = window.physicalSize.height / window.devicePixelRatio;

    _inch = _calculeInc();
  }

  double _calculeInc() => math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));

  double ip(double percent) => _inch * percent / 100;

  double wp(double percent) => _width * percent / 100;

  double hp(double percent) => _height * percent / 100;

  double get aspectRatio => _width / _height;
  double get currentWidth => _width;
  double get currentHeight => _height;
}
