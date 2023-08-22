import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';

class TextFieldLocationWidget extends StatelessWidget {
  String? hintText;

  final Function pressed;
  TextFieldLocationWidget({Key? key, this.hintText = "", required this.pressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            ThemeUtils.shadowCard,
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            children: [
              const Icon(Icons.location_on_outlined, color: Color(0xFF2E3E5C)),
              GestureDetector(
                onTap: (){
                    pressed();
                },
                child: SizedBox(
                  
                  width: Get.context!.width*0.70,
                  //color: Colors.green,
                  child: Text(hintText ?? "")),
              ),
              const Spacer(),

              if(hintText!.isNotEmpty)
              InkWell(
                onTap: () {
                  pressed();
                },
                child: const SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
