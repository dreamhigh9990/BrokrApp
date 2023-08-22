import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/ui/widgets/tiles/amenities_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/characteristics_widget.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/ui/widgets/tiles/review_tile_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../models/super_model.dart';
import '../../guest/pages/home/guest_home_controller.dart';
import '../map_my_position_widget.dart';
import '../text_align_left_widget.dart';
import 'locale/about_the_host_widget.dart';
import 'locale/column_headers_widget.dart';
import 'locale/description_widget.dart';
import 'locale/features_widget.dart';
import 'locale/header_image_item_widget.dart';
import 'locale/header_title_item_widget.dart';
import 'locale/header_widget.dart';
import 'locale/list_tile_widget.dart';
import 'locale/rating_and_reviews_widget.dart';
import 'locale/similars_widget.dart';
import 'locale/specifications_widget.dart';

class BoatBookingWidget extends StatefulWidget {
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
  State<BoatBookingWidget> createState() => _BoatBookingWidgetState();
}

class _BoatBookingWidgetState extends State<BoatBookingWidget> {
  final double heightImage = 175;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final GuestHomeController guestHomeController = Get.find();
  ScrollController? _scrollController;
  bool lastStatus = false;
  double height = 0;
  bool showAll = true;
  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    height = Get.context!.height * 0.22;
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        HeaderSliverWidget(
          isShrink: lastStatus,
          imageUrl: widget.image,
        ),
        SliverToBoxAdapter(child: body()),
      ],
    );
  }

  Widget body() {
    return  Padding(
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
          //const CancelationPolicyWidget(),
    
          const SizedBox(
            height: 10.0,
          ),
    
          ListTileColumnWidget(
            pressed: () {},
            notShowDivider: false,
            title: "Cancellation Policy",
            subtitle: "Flexible",
            body:
                "Free cancellation and full refund before Nov 5, 11:00 AM",
            icon: "cancel_policy",
          ),
          const SizedBox(
            height: 10.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 20.0,
          ),
          SpecificationsWidget(amenities: widget.amenities),
          DescriptionWidget(
            title: "About  This Boat",
          ),
          FeaturesWidget(
                 widgetAll: Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    showAll = !showAll;
                  });
                },
                child: Text(
                  'Read All',
                  style: TextStyle(
                      color: ThemeUtils.colorPurple,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp),
                ),
              ),
            ),
            show: showAll,
              sampleCharacteristics: widget.characteristics,
              title: "Amenities"),
          TextAlignLeft(title: "Location"),
          const SizedBox(
            height: 5.0,
          ),
          MapSampleWidget(),
    
          const SizedBox(
            height: 10.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 20.0,
          ),
    
          DescriptionWidget(
            title: "Allowed on Boat",
            body:
                "A security deposit hold (not a charge) will be placed on your credit card 48 hours before your booking starts to cover any incidental damage that may occur during your rental. ",
          ),
          AboutTheHostWidget(crew: widget.crew),
          RatingAndReviwsWidget(reviews: widget.reviews),
    
          TextAlignLeft(title: "Similar Boats"),
          const SizedBox(
            height: 5.0,
          ),
          SimilarsWidget(position: 2),
          const SizedBox(
            height: 20.0,
          ),
          const Center(
            child: AutoSizeText(
              'Report Listing',
              style: TextStyle(
                  fontSize: 12, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
