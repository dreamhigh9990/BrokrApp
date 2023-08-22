import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/crew_member_model.dart';
import 'package:brokr/models/policy_model.dart';
import 'package:brokr/models/super_model.dart';
import 'package:brokr/ui/bottom_sheets/bottom_sheets_utils.dart';
import 'package:brokr/ui/guest/pages/home/fragments/car/car_camera_page.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/description_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/header_title_item_widget.dart';
import 'package:brokr/ui/widgets/booking_detail/locale/list_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/amenities_tile_widget.dart';
import 'package:brokr/ui/widgets/tiles/characteristics_widget.dart';
import 'package:brokr/ui/widgets/tiles/review_tile_widget.dart';
import 'package:brokr/utils/calendar_utils.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../bottom_sheets/bottom_sheets_guest.dart';
import '../../bottom_sheets/hours_list_widget.dart';
import '../map_my_position_widget.dart';
import '../text_align_left_widget.dart';
import 'locale/about_the_host_widget.dart';
import 'locale/column_headers_widget.dart';
import 'locale/features_widget.dart';
import 'locale/header_widget.dart';
import 'locale/pickup_return_widget.dart';
import 'locale/similars_widget.dart';
import 'locale/specifications_widget.dart';
import 'locale/rating_and_reviews_widget.dart';

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

  CarBookingWidget({
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
  final GuestHomeController guestHomeController = Get.find();
  ScrollController? _scrollController;
  bool lastStatus = false;
  double height = 0;
  String content = "New Jersey, Bloomfield, 72 Avenue 4514";
  String pickupDate = "Sat, 08 Oct";
  String returnDate = "Sat, 08 Oct";
  HourModel firstHour = HourModel(title: "10:00 AM", value: false);
  HourModel secondHour = HourModel(title: "10:00 AM", value: false);
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
        SliverToBoxAdapter(child: listItems()),
      ],
    );
  }

  Widget listItems() {
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
          DatesColumnHeadersWidget(
            title: "Dates",
            svg: "circle_dates",
            firstHour: firstHour,
            secondHour: secondHour,
            pickupDate: pickupDate,
            returnDate: returnDate,
            callback: () async {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild: guestHomeController.bottomSheests.whenForCars(
                      hourStart: HourModel(title: "", value: false),
                      hourEnd: HourModel(title: "", value: false),
                      controller: guestHomeController,
                      location: null,
                      getBackFunction: () {}),
                  height: Get.context!.height * 0.9450);
              if (response != null) {
                pickupDate = response["pickupDate"] as String;
                returnDate = response["returnDate"] as String;
                firstHour = response["hourStart"] as HourModel;
                secondHour = response["hourEnd"] as HourModel;

                pickupDate = DatesUtils().formatToNewFormat(pickupDate);
                returnDate = DatesUtils().formatToNewFormat(returnDate);

                /*    widget.contentDate =
                    "$pickupDate , ${firstHour.title}\n$returnDate ${secondHour.title}"; */
                setState(() {});
              }
            },
          ),
          ColumnHeadersWidget(
            isShowChange: false,
            title: "Pickup & Return",
            svg: "circle_location",
            content: content,
            callback: () async {
              var result = await Get.to(const PickUpReturnWidget());
              if (result != null) {
                content = result["result"] as String;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 10.0),
          TextAlignLeft(title: "Requirements"),

          
          LisTileWidgetNoTrailing(
            functionOntap: () {},
            title: "Age Required",
            subtitle: "You must be at least 25 years old to rent",
            assets: "assets/icons/age_required.svg",
          ),
          LisTileWidgetNoTrailing(
            functionOntap: () async {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild:
                      guestHomeController.bottomSheests.securityDeposit(),
                  height: Get.context!.height * 0.45);
            },
            title: "Security deposit",
            subtitle: "Super cars like Luis’s require a security deposit.",
            assets: "assets/icons/s_deposit.svg",
          ),
          LisTileWidget(
            title: "Valid Driver\'s License ",
            subtitle: "Must be up to date",
            assets: "assets/icons/driver_license.svg",
            function: () {
              BottomSheetsUtils.buildBottomSheet(
                  context: context,
                  child: BottomSheetsUtils().addCameraOrGallery(
                    "Add License",
                    context: context,
                  ),
                  height: Get.context!.height * 0.35,
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
                  child: BottomSheetsUtils().addCameraOrGallery(
                      context: context,
                      "Add Insurance Card",
                      anotherWidget: true),
                  height: Get.context!.height * 0.45,
                  color: Colors.white,
                  padding: const EdgeInsets.all(5.0));
            },
          ),
          ListTileColumnWidget(
            pressed: () async {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild: guestHomeController.bottomSheests.mileageinfo(),
                  height: Get.context!.height * 0.45);
            },
            title: "Mileage included",
            subtitle: "300 miles for free",
            body: "Mileage package available if you plan to drive further",
            icon: "mileage",
          ),
          ListTileColumnWidget(
            pressed: () async {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild:
                      guestHomeController.bottomSheests.cancellationPolicy(),
                  height: Get.context!.height * 0.5);
            },
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
          SpecificationsWidget(amenities: widget.amenities, title: "Basics"),
          DescriptionWidget(),
          FeaturesWidget(
            sampleCharacteristics: widget.sampleCharacteristics,
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
          TextAlignLeft(title: "Location"),
          const SizedBox(
            height: 15.0,
          ),
          MapSampleWidget(),
          const SizedBox(
            height: 20.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 20.0,
          ),
          DescriptionWidget(
            title: "Car guidelines",
            body: "**93 Octane Gas Only*** " +
                "Please be advised this is a non-smoking vehicle. Any signs or smells of smoke will result in a \$300 A/C system, carpet and leather interior cleaning",
          ),
          const SizedBox(
            height: 10.0,
          ),
          AboutTheHostWidget(crew: widget.crew),
          RatingAndReviwsWidget(reviews: widget.reviews),
          const SizedBox(
            height: 5.0,
          ),
          TextAlignLeft(title: "Similar Cars"),
          const SizedBox(
            height: 10.0,
          ),
          SimilarsWidget(position: 0),
          const SizedBox(
            height: 20.0,
          ),
          AutoSizeText(
            'Report Listing',
            style: TextStyle(
              fontSize: 12,
              decoration: TextDecoration.underline,
              color: ThemeUtils.colorPurple,
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
