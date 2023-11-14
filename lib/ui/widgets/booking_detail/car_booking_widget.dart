import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/models/super_model.dart';
import 'package:brokr/ui/bottom_sheets/bottom_sheets_utils.dart';
import 'package:brokr/ui/guest/fragments/request_to_book/car_request_book_page.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/cancelation_policy_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/description_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/header_image_item_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/header_title_item_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/list_tile_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/pickup_return_widget.dart';
import 'package:brokr/ui/widgets/tiles/amenities_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/characteristics_widget.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/ui/widgets/tiles/review_tile_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/form_utils.dart';
import '../map_my_position_widget.dart';
import '../text_align_left_widget.dart';
import 'locale/about_the_host_widget.dart';
import 'locale/column_headers_widget.dart';
import 'locale/features_widget.dart';
import 'locale/similars_widget.dart';
import 'locale/specifications_widget.dart';
import 'locale/rating_and_reviews_widget.dart';
import 'locale/row_button_widget.dart';

class CarBookingWidget extends StatefulWidget {
  final SuperModel superModel;
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
  final List<CharactersticsWidget> sampleCharacteristics;

  final VoidCallback messageHost;
  final CrewMember crew;
  final List<AmenitiesTieWidget> amenities;
  final List<ReviewTileHorizontalWidget> reviews;
  final List<String> allowed;
  final List<String> notAllowed;

  final VoidCallback onPressContinue;

  const CarBookingWidget({
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
    required this.bed,
    required this.bath,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.guests,
    required this.policy,
    required this.crew,
    required this.sampleCharacteristics,
    required this.amenities,
    required this.reviews,
    required this.allowed,
    required this.notAllowed,
    required this.onPressContinue,
    required this.messageHost,
  });

  @override
  State<CarBookingWidget> createState() => _CarBookingWidgetState();
}

class _CarBookingWidgetState extends State<CarBookingWidget> {
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderImageItemWidget(imageUrl: widget.image, isShow: true),
        Container(
          margin: ThemeUtils.paddingScaffoldxTop10,
          padding: ThemeUtils.paddingScaffoldx05,
          child: Column(
            children: [
              HeaderTitleItemWidget(
                  title: "Title Full Listing Card Item",
                  owner: widget.owner,
                  address: "Location Item Listing",
                  description: widget.description,
                  rating: widget.rating,
                  bath: widget.bath),
               ColumnHeadersWidget(
                title: "Dates",
                svg: "circle_dates",
                content: "Sat, Oct 08, 10:30 AM\nSat, Oct 08, 10:30 AM",
                isShowChange: false,
              ),
               ColumnHeadersWidget(
                  isShowChange: false,
                  title: "Pickup & Return",
                  svg: "circle_location",
                  content: "New Jersy, Bloomfield,  72 Avenue 8731"),
              const CancelationPolicyWidget(),
              TextAlignLeft(title: "Requirements to rent"),
              const SizedBox(
                height: 10.0,
              ),
              LisTileWidgetNoTrailing(
                title: "Age Required",
                subtitle: "You must be at least 25 years old to rent",
                assets: "assets/icons/age_required.svg",
              ),
              LisTileWidget(
                title: "Valid Driver\'s License ",
                subtitle: "Must be up to date",
                assets: "assets/icons/driver_license.svg",
                function: () {
                  BottomSheetsUtils.buildBottomSheet(
                      context: context,
                      child:
                          BottomSheetsUtils().addCameraOrGallery("Add License"),
                      height: Get.context!.height * 0.325,
                      color: Colors.white,
                      padding: const EdgeInsets.all(5.0));
                },
              ),
              LisTileWidget(
                title: "Insurance Card",
                subtitle: "The insurance must mathc the drivers information",
                assets: "assets/icons/insurance_card.svg",
                function: () {
                  BottomSheetsUtils.buildBottomSheet(
                      context: context,
                      child: BottomSheetsUtils()
                          .addCameraOrGallery("Add Insurance Card",anotherWidget: true),
                      height: Get.context!.height * 0.40,
                      color: Colors.white,
                      padding: const EdgeInsets.all(5.0));
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              SpecificationsWidget(amenities: widget.amenities),
              const DescriptionWidget(),
              FeaturesWidget(
                  sampleCharacteristics: widget.sampleCharacteristics),
              TextAlignLeft(title: "Location"),
              const SizedBox(
                height: 5.0,
              ),
              MapSampleWidget(),
              RatingAndReviwsWidget(reviews: widget.reviews),
              AboutTheHostWidget(crew: widget.crew),
               TextAlignLeft(title: "Similar Cars"),
              const SizedBox(
                height: 5.0,
              ),
              SimilarsWidget(position: 0),
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
                      Get.to(CarRequestBookPage(
                        superModel: widget.superModel,
                        address: widget.address,
                        bath: widget.bath,
                        description: widget.description,
                        owner: widget.owner,
                        rating: widget.rating,
                        title: widget.title,
                      ));
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
