
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const Tile({
    Key? key,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        height: height,
        width: width,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 0, top: 20),
                        child: child)
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
