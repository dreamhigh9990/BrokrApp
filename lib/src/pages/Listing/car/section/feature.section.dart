import 'package:brokr/src/blocs/listing_car.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brokr/src/pages/Listing/yacht/section/allowed.section.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class CarFeatureSection extends StatelessCustom {
  final ListingCarBloc bloc;

  CarFeatureSection({Key? key, required this.bloc}) : super(key: key);

  final List<Allowed> allowedList = [
    Allowed(icon: FontAwesomeIcons.accessibleIcon, name: "Wheelchair Accessible"),
    Allowed(icon: FontAwesomeIcons.anchor, name: "Anchor"),
    Allowed(icon: FontAwesomeIcons.circlePlay, name: "Android auto"),
    Allowed(icon: FontAwesomeIcons.circlePlay, name: "Apple CarPlay"),
    Allowed(icon: FontAwesomeIcons.volumeHigh, name: "AUX input"),
    Allowed(icon: FontAwesomeIcons.video, name: "Backup camera"),
    Allowed(icon: FontAwesomeIcons.personBiking, name: "Bike rack"),
    Allowed(icon: FontAwesomeIcons.carOn, name: "Blind spot warning"),
    Allowed(icon: FontAwesomeIcons.bluetoothB, name: "Bluetooth"),
    Allowed(icon: FontAwesomeIcons.child, name: "Child seat"),
    Allowed(icon: FontAwesomeIcons.carSide, name: "Convertible"),
    Allowed(icon: FontAwesomeIcons.satellite, name: "GPS"),
    Allowed(icon: FontAwesomeIcons.temperatureArrowUp, name: "Heated seats"),
    Allowed(icon: FontAwesomeIcons.lockOpen, name: "Keyless entry"),
    Allowed(icon: FontAwesomeIcons.paw, name: "Pet friendly"),
    Allowed(icon: FontAwesomeIcons.personSkiing, name: "Ski rack"),
    Allowed(icon: FontAwesomeIcons.snowflake, name: "Snow tires or chains"),
    Allowed(icon: FontAwesomeIcons.sun, name: "Sunroof"),
    Allowed(icon: FontAwesomeIcons.sun, name: "Toll pass"),
    Allowed(icon: FontAwesomeIcons.usb, name: "USB charger"),
    Allowed(icon: FontAwesomeIcons.usb, name: "USB input"),
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
              SliverToBoxAdapter(
                child: Container(
                  padding: EdgeInsets.only(bottom: responsive.hp(3)),
                  alignment: Alignment.center,
                  child: Text(
                    'Apple CarPlay is a registered trademark of Apple Inc. Android is a trademark of Google LLC.',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
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
