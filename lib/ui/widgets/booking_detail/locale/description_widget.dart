import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import '../../text_align_left_widget.dart';

class DescriptionWidget extends StatelessWidget {
  String? body;
  String? title; 

   DescriptionWidget({super.key,
   this.title="Description",
   this.body=           "The Huracan EVO Spyder lets one experience the thrill of extreme driving. Colors, smells and sounds meld with a seductive design and ultra-light materials. The 640 hp naturally aspirated V10 engine roars with authority, as the exhaust announces the presence of a formidable machine. The aerodynamic lines of the super sports car, perfectly streamlined, slice through the air.",

   });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         const SizedBox(
          height: 0.0,
        ),
        TextAlignLeft(title: title!),
        const SizedBox(
          height: 15.0,
        ),
         Text(
          body!,
          textAlign: TextAlign.justify,
          style:const TextStyle(
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
            child:  Text(
              'Read all',
              style: TextStyle(
                  color: ThemeUtils.colorPurple,
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
