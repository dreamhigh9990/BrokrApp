import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/yacht_info.section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Allowed {
  final IconData icon;
  final String name;
  Allowed({required this.icon, required this.name});
}

class AllowedSection extends StatelessCustom {
  final ListingYachtBloc bloc;

  AllowedSection({
    Key? key,
    required this.bloc,
  }) : super(key: key);

  final List<Allowed> allowedList = [
    Allowed(icon: FontAwesomeIcons.dog, name: "Pets"),
    Allowed(icon: FontAwesomeIcons.personSwimming, name: "Swimming"),
    Allowed(icon: FontAwesomeIcons.wineBottle, name: "Alcohol"),
    Allowed(icon: FontAwesomeIcons.kitchenSet, name: "Cooking"),
    Allowed(icon: FontAwesomeIcons.shoePrints, name: "Shoes"),
    Allowed(icon: FontAwesomeIcons.smoking, name: "Smoking"),
    Allowed(icon: FontAwesomeIcons.child, name: "Kids under 12"),
    Allowed(icon: FontAwesomeIcons.fishFins, name: "Fishing"),
    Allowed(icon: FontAwesomeIcons.bottleWater, name: "Glass bottles"),
    Allowed(icon: FontAwesomeIcons.gifts, name: "Decorations"),
    Allowed(icon: FontAwesomeIcons.wineGlass, name: "Red wine"),
    Allowed(icon: FontAwesomeIcons.ship, name: "Liveaboard"),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Allowed>>(
      stream: bloc.allowedsStream,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Allowed>> snapshot) {
        return Container(
          padding: EdgeInsets.only(top: responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              // SliverToBoxAdapter(
              //   child: Text(
              //     "Whats allowed on your yacht?",
              //     style: fontSize.headline5(),
              //   ),
              // ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(2),
                  vertical: responsive.hp(3),
                ),
                sliver: SliverGrid.count(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    allowedList.length,
                    (index) {
                      final active = (snapshot.data
                              ?.map<String>((e) => e.name)
                              .contains(allowedList[index].name)) ??
                          false;
                      return IconCard(
                        value: active,
                        allowed: allowedList[index],
                        onSelected: (bool status) => status
                            ? bloc.addAllowed(allowedList[index])
                            : bloc.removeAllowed(allowedList[index]),
                      );
                    },
                  ),
                ),
              ),
              // SliverToBoxAdapter(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         "Whats not allowed on your yacht?",
              //         style: fontSize.headline5(),
              //       ),
              //       SizedBox(height: responsive.hp(4)),
              //       InputCustomOutline(
              //         maxLength: 1000,
              //         maxLines: 8,
              //         buildCounter: (context,
              //             {required currentLength,
              //             required isFocused,
              //             maxLength}) {
              //           var total = maxLength! - currentLength;
              //           return Text("$total characters remaining");
              //         },
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}

class IconCard extends StateFullCustom {
  IconCard({
    Key? key,
    required this.allowed,
    this.onSelected,
    required this.value,
  }) : super(key: key);
  @override
  IconCardState createState() => IconCardState();

  final Function(bool)? onSelected;
  final Allowed allowed;
  final bool value;
}

class IconCardState extends State<IconCard> {
  // bool active = false;

  @override
  void initState() {
    // setState(() {
    //   active = widget.value;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onSelected != null) {
          widget.onSelected!(!widget.value);
        }
      },
      child: Card(
        color: widget.value ? widget.colorsTheme.secondary : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: widget.value
                  ? LinearGradient(
                      colors: [
                        widget.colorsTheme.primary,
                        widget.colorsTheme.secondary,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight,
                      transform: const GradientRotation(05),
                    )
                  : null),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(
                widget.allowed.icon,
                color: widget.value ? Colors.white : Colors.black,
              ),
              SizedBox(
                height: widget.responsive.hp(1),
              ),
              Text(
                widget.allowed.name,
                style: TextStyle(
                  color: widget.value ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
