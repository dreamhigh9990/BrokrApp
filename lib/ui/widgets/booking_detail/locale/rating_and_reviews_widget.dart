import 'package:brokr/ui/widgets/booking_detail/locale/comments_reviews_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';
import '../../text_align_left_widget.dart';
import '../../tiles/review_tile_widget.dart';

class RatingAndReviwsWidget extends StatelessWidget {
  final List<ReviewTileHorizontalWidget> reviews;
  const RatingAndReviwsWidget({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAlignLeft(title: "Raiting & Reviews"),
        const SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: Get.context!.width,
          height: Get.context!.height * 0.25,
          child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: true,
            itemCount: reviews.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {}, child: Container(child: reviews[index]));
            },
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: MaterialButton(
            padding: const EdgeInsets.all(0.0),
            minWidth: 0.0,
            elevation: 0,
            onPressed: () {
              Get.to(CommentsAndReviewsWidget(
                reviews: reviews,
              ));
            },
            child: Text(
              'See all reviews',
              style: TextStyle(
                  color: ThemeUtils.colorPurple,
                  fontWeight: FontWeight.bold,
                  fontFamily: ThemeUtils.interRegular,
                  fontSize: 12,
                  decoration: TextDecoration.underline),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ThemeUtils.dividerGrey,
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
