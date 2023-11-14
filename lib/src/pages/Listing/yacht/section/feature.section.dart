import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/allowed.section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FeatureSection extends StatelessCustom {
  final ListingYachtBloc bloc;

  FeatureSection({Key? key, required this.bloc}) : super(key: key);

  final List<Allowed> allowedList = [
    Allowed(icon: FontAwesomeIcons.wind, name: "Air conditioning"),
    Allowed(icon: FontAwesomeIcons.anchor, name: "Anchor"),
    Allowed(icon: FontAwesomeIcons.bath, name: "Bathroom"),
    Allowed(icon: Icons.bluetooth_audio_outlined, name: "Bluetooth audio"),
    Allowed(icon: FontAwesomeIcons.box, name: "Cooler ice chest"),
    Allowed(icon: FontAwesomeIcons.shower, name: "Deck shower"),
    Allowed(icon: Icons.set_meal_outlined, name: "Fish finder"),
    Allowed(icon: Icons.outdoor_grill_outlined, name: "Grill"),
    Allowed(icon: FontAwesomeIcons.ferry, name: "Jet ski"),
    Allowed(icon: FontAwesomeIcons.tv, name: "TV"),
    Allowed(icon: FontAwesomeIcons.fishFins, name: "Rod holders"),
    Allowed(icon: FontAwesomeIcons.mask, name: "Snorkeling gear"),
    Allowed(icon: FontAwesomeIcons.sliders, name: "Slide"),
    Allowed(icon: Icons.miscellaneous_services_outlined, name: "Miscellaneous floating"),
    Allowed(icon: Icons.kayaking_outlined, name: "Paddle board"),
    Allowed(icon: FontAwesomeIcons.hotTubPerson, name: "Jacuzzi"),
    Allowed(icon: Icons.dry_outlined, name: "Dryer"),
    Allowed(icon: Icons.local_laundry_service_outlined, name: "Washing machine"),
    Allowed(icon: Icons.kitchen_outlined, name: "Refrigerator"),
    Allowed(icon: FontAwesomeIcons.kitchenSet, name: "kitchen"),
    Allowed(icon: Icons.microwave_outlined, name: "Microwave"),
    Allowed(icon: FontAwesomeIcons.flask, name: "Oven"),
    Allowed(icon: Icons.local_laundry_service_outlined, name: "Dishwasher"),
    Allowed(icon: Icons.coffee_maker_outlined, name: "Coffee maker"),
    Allowed(icon: FontAwesomeIcons.wifi, name: "Wifi"),
    Allowed(icon: Icons.iron_outlined, name: "Hot iron"),
    Allowed(icon: FontAwesomeIcons.person, name: "Hair dryer"),
    Allowed(icon: FontAwesomeIcons.dumbbell, name: "Gym"),
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
