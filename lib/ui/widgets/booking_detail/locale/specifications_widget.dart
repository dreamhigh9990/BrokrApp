import 'package:flutter/material.dart';

import '../../text_align_left_widget.dart';
import '../../tiles/amenities_tile_widget.dart';

class SpecificationsWidget extends StatelessWidget {
  String? title;
  final List<AmenitiesTieWidget> amenities;
  SpecificationsWidget(
      {super.key, required this.amenities, this.title = "Specifications"});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAlignLeft(title: title!),
        const SizedBox(
          height: 20.0,
        ),
        GridView.builder(
          padding: const EdgeInsets.all(0.0),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: amenities.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10.0,
              childAspectRatio: 1,
              crossAxisCount: 4,
              mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, int position) {
            return GestureDetector(onTap: () {}, child: amenities[position]);
          },
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
