import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../text_align_left_widget.dart';

import '../../tiles/characteristics_widget.dart';

class FeaturesWidget extends StatelessWidget {
  final List<CharactersticsWidget> sampleCharacteristics;
  String? title;
  Widget? widgetAll;
  bool? show;
  FeaturesWidget(
      {super.key,
      required this.sampleCharacteristics,
      this.widgetAll,
      this.show = false,
      this.title = "Features"});

  @override
  Widget build(BuildContext context) {
    print(show);
    return Column(
      children: [
          const SizedBox(
          height: 10.0,
        ),
        TextAlignLeft(title: title!),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          decoration: const BoxDecoration(
              color: Color(0xFFF6F6F7),
              borderRadius: BorderRadius.all(Radius.circular(11))),
          child: GridView.builder(
              padding: EdgeInsets.only(
                  left: Get.context!.width * 0.025,
                  right: Get.context!.width * 0.025),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: show == false
                ? sampleCharacteristics.length
                : 6,
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
        widgetAll!,
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
