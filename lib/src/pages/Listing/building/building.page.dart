import 'package:brokr/src/pages/Listing/building/section/building_info.section.dart';
import 'package:brokr/src/pages/Listing/building/section/confirm_building_submit.section.dart';
import 'package:brokr/src/pages/Listing/building/section/days_available.section.dart';
import 'package:brokr/src/pages/Listing/building/section/feature.section.dart';
import 'package:brokr/src/pages/Listing/building/section/map.section.dart';
import 'package:brokr/src/pages/Listing/building/section/photos_building_section.dart';
import 'package:brokr/src/pages/Listing/building/section/policy_cancellation.section.dart';
import 'package:brokr/src/pages/Listing/building/section/prepare_trip.section.dart';
import 'package:brokr/src/pages/Listing/building/section/trip_accept_longest_time.section.dart';
import 'package:brokr/src/pages/Listing/building/section/trip_accept_time.section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../blocs/listing_building.bloc.dart' show ListingBuildingBloc;
import '../../../models/title_listing.model.dart' show TitleListing;
import '../../../components/custom_widget_page/statefull_custom.dart';
import '../../../pages/Listing/ListingIntro.page.dart' show GradientButton;

import 'package:brokr/src/pages/Listing/building/section/specifications_section.dart';
import 'package:brokr/src/pages/Listing/building/section/things_know.section.dart';
import 'package:brokr/src/pages/Listing/building/section/trip_accept_shortest_time.section.dart';
import 'package:brokr/src/pages/Listing/building/section/allowed.section.dart';
import 'package:brokr/src/pages/Listing/building/section/host.section.dart';
import 'package:brokr/src/pages/Listing/building/section/describe.section.dart';
import 'package:brokr/src/pages/Listing/building/section/guests_unit.section.dart';

final List<TitleListing> sections = [
  TitleListing(
    title: "What kind of place will you host?",
    height: 21.0,
  ),
  TitleListing(
    title: "Describe your place",
    height: 25.0,
  ),
  TitleListing(
    title: "Where is your place located?",
    height: 33.0,
  ),
  TitleListing(
    title: "How many guests does your place allow?",
    height: 35.0
  ),
  TitleListing(
    title: "What guests can find in your unit?",
    height: 20.0
  ),
  TitleListing(
    title: "What your place has to offer?",
    height: 20.0,
  ),
  TitleListing(
    title: "Your place photos",
    subtitle: "Void using photos that contain phone numbers, company logos or watermarks. Photos that contain this information will be edited or removed.",
    height: 20.0,
  ),
  TitleListing(
    title: "Your place listing",
    height: 20.0,
  ),
  TitleListing(
    title: "What’s the shortest possible booking you’ll accept?",
    height: 20.0,
  ),
  TitleListing(
    title: "Cancellation policy",
    subtitle: "Select how you want to handle trip cancellations",
    height: 20.0,
  ),
  TitleListing(
    title: "Things to know",
    subtitle: "Tell guests things they should know about your place",
    height: 20.0,
  ),
  TitleListing(
    title: "House rules",
    subtitle: "Tell guests things that are allowed and not allowed in your place",
    height: 20.0,
  ),
  TitleListing(
    title: "Select your check-in and check-out times",
    height: 20.0,
  ),
  TitleListing(
    title: "How much advance notice do you need to prepare for a booking?",
    height: 20.0,
  ),
  TitleListing(
    title: "What’s the shortest possible stay you’ll accept?",
    height: 20.0,
  ),
  TitleListing(
    title: "What’s the longest possible stay you’ll accept?",
    height: 20.0,
  ),
  TitleListing(
    title: "Please review your place listing before submitting",
    height: 20.0,
  ),
];

class BuildingPage extends StateFullCustom {
  static String name = '/listing/building';
  BuildingPage({Key? key}) : super(key: key);
  @override
  State<BuildingPage> createState() => _BuildingPageState();
}

class _BuildingPageState extends State<BuildingPage> {
  late PageController _pageController;
  late ListingBuildingBloc _bloc;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _bloc = ListingBuildingBloc();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).padding;
    return Scaffold(body: KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        return Container(
          padding: EdgeInsets.only(top: size.top),
          height: widget.responsive.hp(100),
          width: widget.responsive.wp(100),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                widget.colorsTheme.primary,
                widget.colorsTheme.secondary,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [.001, .2, 1],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: widget.responsive.wp(100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                        stream: _bloc.pageStream,
                        initialData: 0,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          final title = sections[snapshot.data];
                          return AnimatedContainer(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.responsive.wp(6),
                            ),
                            duration: const Duration(milliseconds: 300),
                            height: widget.responsive.hp(title.height),
                            child: Center(
                              widthFactor: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title.title,
                                    style: widget.fontSize.headline5(
                                      color: widget.colorsTheme.surface,
                                    ),
                                  ),
                                  title.subtitle != null
                                      ? Padding(
                                          padding: EdgeInsets.only(
                                            top: widget.responsive.hp(3),
                                          ),
                                          child: Text(
                                            "${title.subtitle}",
                                            style: widget.fontSize.subtitle2(
                                              color: widget.colorsTheme.surface,
                                            ),
                                          ),
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(10.0),
                              right: Radius.circular(10.0),
                            ),
                          ),
                          child: PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              BuildingHostSection(bloc: _bloc),
                              DescribeSection(bloc: _bloc),
                              MapSection(bloc: _bloc),
                              SpecificationSection(bloc: _bloc),
                              GuestsUnitSection(bloc: _bloc),
                              BuildingFeatureSection(bloc: _bloc),
                              PhotosBuildingSection(bloc: _bloc),
                              BuildingInfoSection(bloc: _bloc),
                              TripAcceptShortestTimeSection(bloc: _bloc),
                              PolicyCancellationSection(bloc: _bloc),
                              ThingsKnowSection(bloc: _bloc),
                              AllowedSection(bloc: _bloc),
                              DayAvailableSection(bloc: _bloc),
                              PrepareTripHourSection(bloc: _bloc),
                              TripAcceptTimeSection(bloc: _bloc),
                              TripAcceptLongestTimeSection(bloc: _bloc),
                              ConfirmBuildingSubmitSection(bloc: _bloc),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              !isKeyboardVisible
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 10.0,
                      ),
                      height: 80.0,
                      width: widget.responsive.wp(100),
                      color: widget.colorsTheme.surface,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text.rich(
                              TextSpan(
                                text: "Back",
                                style: widget.fontSize.bodyText1().copyWith(
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _pageController
                                        .previousPage(
                                          duration:
                                              const Duration(milliseconds: 100),
                                          curve: Curves.linear,
                                        )
                                        .then((value) => _bloc.addPage(
                                            _pageController.page?.toInt() ??
                                                0));
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
                                  },
                              ),
                            ),
                          ),
                          StreamBuilder(
                            stream: _bloc.pageStream,
                            initialData: 0,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              print("page ====>>>> ${_pageController.page}");
                              return StreamBuilder<bool>(
                                key: Key(snapshot.data.toString()),
                                stream: _bloc.getValidation(
                                    _pageController.page?.toInt() ?? 0),
                                initialData: false,
                                builder: (BuildContext _,
                                    AsyncSnapshot<bool> active) {
                                  print("validation ===>>>>> $active");
                                  return SizedBox(
                                    width: 170,
                                    child: GradientButton(
                                      text: "Continue",
                                      onPressed: active.data!
                                          ? () {
                                              _pageController
                                                  .nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 100),
                                                    curve: Curves.linear,
                                                  )
                                                  .then((value) =>
                                                      _bloc.addPage(
                                                          _pageController.page
                                                                  ?.toInt() ??
                                                              0));
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            }
                                          : null,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      },
    ));
  }
}
