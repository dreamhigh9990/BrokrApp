import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';
import '../../tiles/review_tile_widget.dart';

class CommentsAndReviewsWidget extends StatelessWidget {
  final List<ReviewTileHorizontalWidget> reviews;
  const CommentsAndReviewsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Comments & Reviews",
          style: TextStyle(
              fontFamily: ThemeUtils.interRegular,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: Get.context!.height * 0.035,
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05),
        child: ListView.builder(
          padding: const EdgeInsets.all(0.0),
          shrinkWrap: true,
          itemCount: reviews.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {}, child: Container(
                  height: 170,
                  child: reviews[index]));
          },
        ),
      ),
    );
  }
}
