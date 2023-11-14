import 'package:brokr/src/pages/Listing/car/section/car_info.section.dart';
import 'package:brokr/src/pages/Listing/car/section/confirm_car_submit.section.dart';
import 'package:brokr/src/pages/Listing/car/section/days_available.section.dart';
import 'package:brokr/src/pages/Listing/car/section/feature.section.dart';
import 'package:brokr/src/pages/Listing/car/section/map.section.dart';
import 'package:brokr/src/pages/Listing/car/section/photos_car_section.dart';
import 'package:brokr/src/pages/Listing/car/section/policy_cancellation.section.dart';
import 'package:brokr/src/pages/Listing/car/section/prepare_trip.section.dart';
import 'package:brokr/src/pages/Listing/car/section/trip_accept_longest_time.section.dart';
import 'package:brokr/src/pages/Listing/car/section/trip_accept_time.section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../blocs/listing_car.bloc.dart' show ListingCarBloc;
import '../../../models/title_listing.model.dart' show TitleListing;
import '../../../components/custom_widget_page/statefull_custom.dart';
import '../../../pages/Listing/ListingIntro.page.dart' show GradientButton;
import '../../../pages/Listing/car/section/vin.section.dart' show VinSection;

final List<TitleListing> sections = [
  TitleListing(
    title: "What car do you have?",
    subtitle: "Use your VIN number to help us identify your car",
    height: 21.0,
  ),
  TitleListing(
    title: "Where is your car located?",
    subtitle:
        "The exact location of your car will not be shown to guests or brokers until you have confirmed their trip.",
    height: 33.0,
  ),
  TitleListing(title: "Your car listing", height: 18.0),
  TitleListing(
    title: "Cancellation policy",
    subtitle: "Select how you want to handle trip cancellations.",
    height: 20.0,
  ),
  TitleListing(
    title: "Car features",
    subtitle: "What features make this car great?",
    height: 20.0,
  ),
  TitleListing(
    title: "Car photos",
    height: 20.0,
  ),
  TitleListing(
    title: "Select when is you car available and times ",
    height: 20.0,
  ),
  TitleListing(
    title: "How much advance notice do you need to prepare for a trip?",
    height: 20.0,
  ),
  TitleListing(
    title: "What’s the shortest possible trip you’ll accept?",
    height: 20.0,
  ),
  TitleListing(
    title: "What’s the longest possible trip you’ll accept?",
    height: 20.0,
  ),
  TitleListing(
    title: "Please review your car listing before submitting",
    height: 20.0,
  ),
];

class CarPage extends StateFullCustom {
  static String name = '/listing/car';
  CarPage({Key? key}) : super(key: key);
  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  late PageController _pageController;
  late ListingCarBloc _bloc;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _bloc = ListingCarBloc();
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
                              VinSection(bloc: _bloc),
                              MapSection(bloc: _bloc),
                              CarInfoSection(bloc: _bloc),
                              PolicyCancellationSection(bloc: _bloc),
                              CarFeatureSection(bloc: _bloc),
                              PhotosCarSection(bloc: _bloc),
                              DayAvailableSection(bloc: _bloc),
                              PrepareTripHourSection(bloc: _bloc),
                              TripAcceptTimeSection(bloc: _bloc),
                              TripAcceptLongestTimeSection(bloc: _bloc),
                              ConfirmCarSubmitSection(bloc: _bloc),
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
