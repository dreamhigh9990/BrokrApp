import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CharactersticsWidget extends StatelessWidget {
  final String iconPath;
  final String amenitie;
  final String value;

  const CharactersticsWidget({
    super.key,
    required this.iconPath,
    required this.amenitie,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            color: Colors.black,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(amenitie,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Inter-Regular",
                )),
          ),
        ],
      ),
    );
  }
}

class CharactersticsLargeWidget extends StatelessWidget {
  final String iconPath;
  final String name;
  final String value;

  const CharactersticsLargeWidget({
    super.key,
    required this.iconPath,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            iconPath,
            color: Colors.black,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Text(name, textAlign: TextAlign.center),
          const Spacer(),
          Text(value,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
