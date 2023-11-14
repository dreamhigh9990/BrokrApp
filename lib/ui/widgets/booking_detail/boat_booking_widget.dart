import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/ui/widgets/tiles/amenities_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/characteristics_widget.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/ui/widgets/tiles/review_tile_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/super_model.dart';
import '../map_my_position_widget.dart';
import '../text_align_left_widget.dart';
import 'locale/about_the_host_widget.dart';
import 'locale/cancelation_policy_widget.dart';
import 'locale/column_headers_widget.dart';
import 'locale/description_widget.dart';

import 'locale/features_widget.dart';
import 'locale/header_image_item_widget.dart';
import 'locale/header_title_item_widget.dart';
import 'locale/rating_and_reviews_widget.dart';
import 'locale/similars_widget.dart';
import 'locale/specifications_widget.dart';

class BoatBookingWidget extends StatelessWidget {
  final String title;
  final String owner;
  final String address;
  final String description;
  final String startDate;
  final String endDate;
  final double bed;
  final double bath;
  final int guests;
  final double rating;
  final String image;
  final double price;
  final double price2;
  final bool isFavourite;
  final PolicyModel policy;
  final double heightImage = 175;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final EdgeInsetsGeometry? margin;
  final List<CharactersticsWidget> characteristics;
  final VoidCallback messageHost;

  final CrewMember crew;
  final List<AmenitiesTieWidget> amenities;

  final List<ReviewTileHorizontalWidget> reviews;

  final List<String> allowed;
  final List<String> notAllowed;

  final VoidCallback onPressContinue;

  final SuperModel superModel;

  const BoatBookingWidget({
    super.key,
    required this.superModel,
    required this.title,
    required this.owner,
    required this.address,
    required this.rating,
    required this.image,
    required this.price,
    required this.price2,
    required this.isFavourite,
    this.margin,
    required this.bed,
    required this.bath,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.guests,
    required this.policy,
    required this.crew,
    required this.characteristics,
    required this.amenities,
    required this.reviews,
    required this.allowed,
    required this.notAllowed,
    required this.onPressContinue,
    required this.messageHost,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderImageItemWidget(imageUrl: image, isShow: true),
        Container(
          margin: ThemeUtils.paddingScaffoldxTop10,
          padding: ThemeUtils.paddingScaffoldx05,
          child: Column(
            children: [
              HeaderTitleItemWidget(
                  title: "Title Full Listing Card Item",
                  owner: owner,
                  address: "Location Item Listing",
                  description: description,
                  rating: rating,
                  bath: bath),
              ColumnHeadersWidget(
                title: "When",
                svg: "circle_dates",
                content: "Sat, Oct 08 | 2 Hours | 12:00 AM",
                isShowChange: false,
              ),
              ColumnHeadersWidget(
                  textCenter: true,
                  isShowChange: false,
                  title: "Passengers",
                  svg: "circle_guest",
                  content: "2"),
              const CancelationPolicyWidget(),
              SpecificationsWidget(amenities: amenities),
              const DescriptionWidget(),
              FeaturesWidget(
                  sampleCharacteristics: characteristics, title: "Amenities"),
              TextAlignLeft(title: "Location"),
              const SizedBox(
                height: 5.0,
              ),
              MapSampleWidget(),
              RatingAndReviwsWidget(reviews: reviews),
              AboutTheHostWidget(crew: crew),
              TextAlignLeft(title: "Similar Cars"),
              const SizedBox(
                height: 5.0,
              ),
              SimilarsWidget(position: 2),
              const SizedBox(
                height: 20.0,
              ),
              const AutoSizeText(
                'Report Listing',
                style: TextStyle(
                    fontSize: 12, decoration: TextDecoration.underline),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '138\$/',
                          style: TextStyle(
                              color: ThemeUtils.colorPurple,
                              fontWeight: FontWeight.bold),
                          children: const <TextSpan>[
                            TextSpan(
                                text: 'Day',
                                style: TextStyle(
                                    color: Color(0xFF646464),
                                    fontWeight: FontWeight.normal)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      AutoSizeText(
                        '\$178 Total',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontSize: 12,
                              color: Color(0xFF646464),
                            ),
                      ),
                    ],
                  ),
                  NormalButton(
                    width: Get.context!.width * 0.35,
                    backgroundColor: ThemeUtils.colorPurple,
                    weight: FontWeight.normal,
                    text: 'Continue',
                    onTap: () {
                      /*  Get.to(StayRequestBookPage(
                        superModel: superModel,
                        address: address,
                        bath: bath,
                        description: description,
                        owner: owner,
                        rating: rating,
                        title: title,
                      ));  */
                    },
                    cornersRadius: 10,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
