import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../text_align_left_widget.dart';

import '../../tiles/characteristics_widget.dart';

class FeaturesWidget extends StatelessWidget {
  final List<CharactersticsWidget> sampleCharacteristics;
  String? title;
   FeaturesWidget({super.key, required this.sampleCharacteristics,
  this.title ="Features"
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         TextAlignLeft(title: title!),
       
      const SizedBox(height: 10.0,),
        Container(
           decoration: const BoxDecoration(
          color: Color(0xFFF6F6F7),
          borderRadius: BorderRadius.all(Radius.circular(11))),
          child: GridView.builder(
            padding:  EdgeInsets.only(left: Get.context!.width*0.025,right: Get.context!.width*0.025),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sampleCharacteristics.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 5,
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(child: sampleCharacteristics[index]));
              }),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}
