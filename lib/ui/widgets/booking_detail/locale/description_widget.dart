import 'package:flutter/material.dart';

import '../../../../utils/theme_utils.dart';
import '../../text_align_left_widget.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TextAlignLeft(title: "Description"),
        const SizedBox(
          height: 5.0,
        ),
        const Text(
          "The Huracan EVO Spyder lets one experience the thrill of extreme driving. Colors, smells and sounds meld with a seductive design and ultra-light materials. The 640 hp naturally aspirated V10 engine roars with authority, as the exhaust announces the presence of a formidable machine. The aerodynamic lines of the super sports car, perfectly streamlined, slice through the air.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Color(0xFF505050),
            fontFamily: "Inter-Regular",
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: MaterialButton(
            padding: const EdgeInsets.all(0.0),
            minWidth: 0.0,
            elevation: 0,
            onPressed: () {},
            child: const Text(
              'Read all',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Inter-Regular",
                  fontSize: 12,
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
