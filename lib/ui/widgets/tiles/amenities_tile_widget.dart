// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AmenitiesTieWidget extends StatelessWidget {
  final String amenitie;
  final String iconPath;
  Color? color;
  double? width;
  double? height;
  AmenitiesTieWidget({
    Key? key,
    required this.amenitie,
    required this.iconPath,
    this.color = const Color(0xFFB6B8BD),
    this.height = 35,
    this.width = 35,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFEDECED),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(6.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            iconPath,
            color: color,
            width: width,
            height: height,
          ),
         
          Flexible(
            child: AutoSizeText(
              amenitie.capitalize!,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10.0, color: color,
          
                                 fontFamily: "Inter-Regular",),
            ),
          )
        ],
      ),
    );
  }
}

class AmenitiesIconTieWidget extends StatelessWidget {
  final String amenitie;
  final IconData iconPath;

  const AmenitiesIconTieWidget({
    Key? key,
    required this.amenitie,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconPath,
            color: Colors.grey,
            size: 50,
          ),
          const SizedBox(
            height: 5,
          ),
          AutoSizeText(
            amenitie,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12.0, color: Colors.grey),
          )
        ],
      ),
    );
  }

  
}

