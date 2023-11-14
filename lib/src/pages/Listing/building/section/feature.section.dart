import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brokr/src/pages/Listing/building/section/allowed.section.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class BuildingFeatureSection extends StatelessCustom {
  final ListingBuildingBloc bloc;

  BuildingFeatureSection({Key? key, required this.bloc}) : super(key: key);

  final List<Allowed> allowedList = [
    Allowed(icon: FontAwesomeIcons.water, name: "Pool"),
    Allowed(icon: FontAwesomeIcons.dumbbell, name: "GYM"),
    Allowed(icon: FontAwesomeIcons.bath, name: "Hot tub"),
    Allowed(icon: FontAwesomeIcons.burger, name: "BBQ qrill"),
    Allowed(icon: FontAwesomeIcons.poo, name: "Pool table"),
    Allowed(icon: FontAwesomeIcons.ussunnah, name: "Outdoor dining area"),
    Allowed(icon: FontAwesomeIcons.flask, name: "Patio"),
  //  Allowed(icon: FontAwesomeIcons.buildingOn, name: "Blind spot warning"),
    Allowed(icon: FontAwesomeIcons.dungeon, name: "Indoor fireplace"),
    Allowed(icon: FontAwesomeIcons.worm, name: "Workplace"),
  //  Allowed(icon: FontAwesomeIcons.buildingSide, name: "Convertible"),
    Allowed(icon: FontAwesomeIcons.fan, name: "Air conditioning"),
    Allowed(icon: FontAwesomeIcons.warehouse, name: "Garage"),
    Allowed(icon: FontAwesomeIcons.lockOpen, name: "Free parking On premises"),
    Allowed(icon: FontAwesomeIcons.key, name: "Paid parking On premises"),
    Allowed(icon: FontAwesomeIcons.shower, name: "Outdoor shower"),
    Allowed(icon: FontAwesomeIcons.video, name: "Movie teather"),
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Allowed>>(
      stream: bloc.featureStream,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Allowed>> snapshot) {
        return Container(
          padding: EdgeInsets.only(top: responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
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
                  children: List.generate(allowedList.length, (index) {
                    final active = (snapshot.data
                            ?.map<String>((e) => e.name)
                            .contains(allowedList[index].name)) ??
                        false;
                    return IconCard(
                      value: active,
                      allowed: allowedList[index],
                      onSelected: ((bool status) {
                        status
                            ? bloc.addFeature(allowedList[index])
                            : bloc.removeFeature(allowedList[index]);
                      }),
                    );
                  }),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



class IconCardLarge extends StateFullCustom {
  IconCardLarge({
    Key? key,
    required this.allowed,
    this.onSelected,
    required this.value,
  }) : super(key: key);
  @override
  IconCardLargeState createState() => IconCardLargeState();

  final Function(bool)? onSelected;
  final Allowed allowed;
  final bool value;
}

class IconCardLargeState extends State<IconCardLarge> {
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
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                widget.allowed.icon,
                size: 18,
                color: widget.value ? Colors.white : Colors.black45,
              ),
              SizedBox(
                width: widget.responsive.hp(1),
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
