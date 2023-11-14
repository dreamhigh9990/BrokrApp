import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/models/title_listing.model.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/pages/Listing/yacht/section/allowed.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/available.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/cofirm.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/days_required.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/duration.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/feature.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/init_section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/international_trip.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/map.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/multipe_booking.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/photos_section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/policy.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/prepare_international_trip.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/specifications_section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/things_know.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/yacht_info.section.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

List<TitleListing> sections = [];

class YachtPage extends StateFullCustom {
  static String name = '/listing/yacht';
  YachtPage({Key? key}) : super(key: key);
  @override
  State<YachtPage> createState() => _YachtPageState();
}

class _YachtPageState extends State<YachtPage> {
  late PageController _pageController;
  late ListingYachtBloc _bloc;

  late Future<dynamic> pageFuture;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _bloc = ListingYachtBloc();
    pageFuture = _bloc.pageChange();
    super.initState();
    buildDefaultTitle();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  buildDefaultTitle() {
    sections = [
      TitleListing(title: "", height: 10.0),
      TitleListing(
        title: "Where is your boat located?",
        subtitle:
            "The exact location of your boat will not be shown to guests or brokers until you have confirmed their trip.",
        height: 31.0,
      ),
      TitleListing(title: "Your boat listing", height: 18.0),
      TitleListing(
        title: "Cancellation policy",
        subtitle: "Select how you want to handle trip cancellations.",
        height: 20.0,
      ),
      TitleListing(
        title: "Boat guidelines",
        subtitle:
            "Tell guests things they should know before boarding and during their trip",
        height: 20.0,
      ),
      TitleListing(
        title: "What's allowed on your boat?",
        subtitle:
            "Select approved activities and items for guests to dor or bring on board",
        height: 20.0,
      ),
      TitleListing(
        title: "Boat features",
        subtitle:
          "To provide extensive information to your guests, select as many features as possible",
        height: 20.0,
      ),
      TitleListing(title: "Boat photos", height: 18.0),
      TitleListing(title: "Boat specifications", height: 18.0),
      TitleListing(
        title: "Select your available days and  hours of operation",
        height: 20.0,
      ),
      TitleListing(
        title: "Select which durations you would like to offer",
        height: 20.0,
      ),
      TitleListing(
        title: "Do you want to allow multiple bookings in one day?",
        height: 20.0,
      ),
      TitleListing(
        title: "Would you like to offer intertational trips?",
        height: 20.0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).padding;
    return Scaffold(
      body: KeyboardVisibilityBuilder(
        builder: (_, isKeyboardVisible) {
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
                                                color:
                                                    widget.colorsTheme.surface,
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
                            child: StreamBuilder(
                              stream: _bloc.internationalTripStream,
                              initialData: false,
                              builder:
                                  (BuildContext _, AsyncSnapshot snapshot) {
                                List<Widget> sectionPages = [
                                  InitSection(bloc: _bloc),
                                  MapSection(bloc: _bloc),
                                  YachtInfoSection(bloc: _bloc),
                                  PolicySection(bloc: _bloc),
                                  ThingsKnowSection(bloc: _bloc),
                                  AllowedSection(bloc: _bloc),
                                  FeatureSection(bloc: _bloc),
                                  PhotoSection(bloc: _bloc),
                                  SpecificationSection(bloc: _bloc),
                                  AvailableSection(bloc: _bloc),
                                  DurationSection(bloc: _bloc),
                                  MultipleBookingSection(bloc: _bloc),
                                  InternationTripSection(bloc: _bloc),
                                ];
                                buildDefaultTitle();
                                if (snapshot.data) {
                                  sectionPages.add(
                                      PrepareInternationalTripSection(
                                          bloc: _bloc));
                                  sectionPages
                                      .add(DaysRequiredSection(bloc: _bloc));

                                  sections.add(TitleListing(
                                    title:
                                        "How much time do you need to prepare for an international trip?",
                                    height: 20.0,
                                  ));
                                  sections.add(TitleListing(
                                    title:
                                        "How many days minimun you require for an international trip?",
                                    height: 20.0,
                                  ));
                                }

                                sections.add(TitleListing(
                                  title:
                                      "Please review your boat listing before submitting",
                                  height: 20.0,
                                ));

                                sectionPages.add(ConfirmSection(bloc: _bloc));
                                return PageView(
                                  controller: _pageController,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: sectionPages,
                                );
                              },
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
                                            duration: const Duration(
                                                milliseconds: 100),
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
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
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
                                        text:
                                            snapshot.data == sections.length - 1
                                                ? "Submit"
                                                : "Continue",
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
                                                FocusManager
                                                    .instance.primaryFocus
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
      ),
    );
  }
}
