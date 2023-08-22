import 'package:flutter/material.dart';
class PositionCameraWidget extends StatelessWidget {
  double? top, bottom, right, left;
  final Function presesd;

  PositionCameraWidget(
      {super.key,
      this.top,
      this.bottom,
      this.right,
      this.left,
      required this.presesd});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: bottom,
        right: right,
        top: top,
        left: left,
        child: MaterialButton(
          shape: const CircleBorder(),
          color: const Color(0xFFF9F9F9),
          height: 50.0,
          minWidth: 50,
          onPressed: () {
            presesd();
          },
          child: const Icon(
            Icons.camera_alt,
            color: Color(0xFF7E8182),
          ),
        ));
  }
}
