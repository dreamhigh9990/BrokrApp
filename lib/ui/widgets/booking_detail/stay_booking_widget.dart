import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/models/super_model.dart';
import 'package:brokr/ui/widgets/tiles/amenities_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/characteristics_widget.dart';
import 'package:brokr/ui/widgets/tiles/review_tile_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../guest/pages/home/guest_home_controller.dart';
import '../map_my_position_widget.dart';
import '../text_align_left_widget.dart';
import 'locale/about_the_host_widget.dart';
import 'locale/column_headers_widget.dart';
import 'locale/description_widget.dart';
import 'locale/features_widget.dart';
import 'locale/header_widget.dart';
import 'locale/list_tile_widget.dart';
import 'locale/similars_widget.dart';
import 'locale/specifications_widget.dart';
import 'locale/header_image_item_widget.dart';
import 'locale/header_title_item_widget.dart';
import 'locale/rating_and_reviews_widget.dart';

class StayBookingWidget extends StatefulWidget {
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
  final EdgeInsetsGeometry? margin;
  final List<CharactersticsWidget> characteristics;
  final VoidCallback messageHost;

  final CrewMember crew;
  final List<AmenitiesTieWidget> sampleAmenities;

  final List<ReviewTileHorizontalWidget> reviews;

  final List<String> allowed;
  final List<String> notAllowed;

  final VoidCallback onPressContinue;
  final List<AmenitiesTieWidget> sleepAmenities;
  const StayBookingWidget({
    super.key,
    required this.sleepAmenities,
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
    required this.sampleAmenities,
    required this.reviews,
    required this.allowed,
    required this.notAllowed,
    required this.onPressContinue,
    required this.messageHost,
  });

  @override
  State<StayBookingWidget> createState() => _StayBookingWidgetState();
}

class _StayBookingWidgetState extends State<StayBookingWidget> {
  final double heightImage = 175;
  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final GuestHomeController guestHomeController = Get.find();
  ScrollController? _scrollController;
  double _previousScrollPosition = 0.0;
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
    return Padding(
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
              title: "Guest",
              svg: "circle_guest",
              content: "7 Adults, 1 Infant, 4 Children, 1 Pet"),
          /*   const CancelationPolicyWidget(), */
          const SizedBox(
            height: 20.0,
          ),
          SpecificationsWidget(amenities: widget.sampleAmenities),
          SpecificationsWidget(
              amenities: widget.sleepAmenities, title: "You’ll sleep"),
          ListTileColumnWidget(
            pressed: () {},
            notShowDivider: false,
            title: "Cancellation Policy",
            subtitle: "Flexible",
            body: "Free cancellation and full refund before Nov 5, 11:00 AM",
            icon: "cancel_policy",
          ),
          const SizedBox(
            height: 10.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 10.0,
          ),
          FeaturesWidget(
            sampleCharacteristics: widget.characteristics,
            title: "Amenities",
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
          ),
          DescriptionWidget(
            title: "About This Stay",
            body:
                "The Huracan EVO Spyder lets one experience the thrill of extreme driving. Colors, smells and sounds meld with a seductive design and ultra-light materials. The 640 hp naturally aspirated V10 engine roars with authority, as the exhaust announces the presence of a formidable machine. The aerodynamic lines of the super sports car, perfectly streamlined, slice through the air.",
          ),
          TextAlignLeft(title: "Location"),
          const SizedBox(
            height: 5.0,
          ),
          MapSampleWidget(),
          const SizedBox(
            height: 10.0,
          ),
          DescriptionWidget(
            title: "Stay Rules",
            body:
                "You'll be staying in someone's home, so please treat it with care and respect."
                "\nChecking in and out"
                "\nFlexible check-in"
                "\nCheckout before 3:00 PM",
          ),
          const SizedBox(
            height: 5.0,
          ),
          TextAlignLeft(title: "Nearby Places"),
          const SizedBox(
            height: 20.0,
          ),
          customPlaces("Grantley Adams International Airport (BGI)", "12 min"),
          const SizedBox(
            height: 5.0,
          ),
          customPlaces("Beach Mulli ", "12 min"),
          const SizedBox(
            height: 5.0,
          ),
          customPlaces("Beach Sandy Lane ", "12 min"),
          const SizedBox(
            height: 5.0,
          ),
          customPlaces("Beach Paynes Bay ", "12 min"),
          const SizedBox(
            height: 5.0,
          ),
          customPlaces("Beach Heywoods", "12 min"),
          const SizedBox(
            height: 20.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 20.0,
          ),
          AboutTheHostWidget(crew: widget.crew),
          RatingAndReviwsWidget(reviews: widget.reviews),
          TextAlignLeft(title: "Similar Stays"),
          const SizedBox(
            height: 5.0,
          ),
          SimilarsWidget(position: 1),
          const SizedBox(
            height: 20.0,
          ),
          const Center(
            child: AutoSizeText(
              'Report Listing',
              style:
                  TextStyle(fontSize: 12, decoration: TextDecoration.underline),
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }

  Widget customPlaces(
    String title,
    String body,
  ) {
    return Row(
      children: [
        AutoSizeText(
          title,
          style: const TextStyle(
            fontSize: 14.0,
            color: Color(0xFF505050),
          ),
        ),
        const Spacer(),
        AutoSizeText(body,
            style: const TextStyle(
              fontSize: 14.0,
              color: Color(0xFF505050),
              fontWeight: FontWeight.bold,
            ))
      ],
    );
  }

  Widget customRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: ListTile(
          onTap: () async {},
          minLeadingWidth: 0.0,
          minVerticalPadding: 0.0,
          contentPadding: const EdgeInsets.all(0.0),
          title: const Text(
            "Nov 22/23",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          leading: const Icon(
            Icons.calendar_today_outlined,
            color: Colors.black,
          ),
        )),
        Container(
          width: 1.5,
          height: 30.0,
          color: Colors.black.withOpacity(.5),
        ),
        Expanded(
            child: ListTile(
          onTap: () async {},
          minLeadingWidth: 0.0,
          minVerticalPadding: 0.0,
          title: const Text(
            "Nov 22/23",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          leading: const Icon(
            Icons.calendar_today_outlined,
            color: Colors.black,
          ),
        )),
      ],
    );
  }
}
