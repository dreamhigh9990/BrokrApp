import 'package:flutter/material.dart';

class CustomSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const CustomSliderThumbCircle({
    required this.thumbRadius,
    this.min = 0,
    this.max = 10,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.blue //Thumb Background Color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final paint1 = Paint()
      ..color = Colors.white //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    Offset centerRRect = Offset(center.dx - 40, center.dy - 15);

    final rrect = RRect.fromRectAndRadius(
        centerRRect & const Size(80, 30), const Radius.circular(10));
    canvas.drawRRect(rrect, paint);
    canvas.drawRRect(rrect, paint1);

    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    final minutes = (min + (max - min) * value).round();
    final time = durationToString(minutes);
    return time;
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    var hour = parts[0];
    final prefix = int.parse(hour) >= 12 ? "PM" : "AM";
    hour = int.parse(hour) > 12 ? (int.parse(hour) - 12).toString() : hour;
    return '${hour.padLeft(2, '0')}:${parts[1].padLeft(2, '0')} $prefix';
  }
}
