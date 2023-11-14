import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/pages/Listing/yacht/section/allowed.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/policy.section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Specifications {
  final IconData icon;
  final String label;
  final String value;

  Specifications({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class ConfirmSection extends StateFullCustom {
  final ListingYachtBloc bloc;

  ConfirmSection({super.key, required this.bloc});
  @override
  State<ConfirmSection> createState() => _ConfirmSectionState();
}

class _ConfirmSectionState extends State<ConfirmSection> {
  late Yacht form;

  late List<Specifications> specifications;

  @override
  void initState() {
    form = widget.bloc.getValueForSubmit();
    specifications = [
      Specifications(
          icon: FontAwesomeIcons.ship, label: "Make", value: form.make),
      Specifications(
          icon: FontAwesomeIcons.calendarDays, label: "Year", value: form.year),
      Specifications(
          icon: FontAwesomeIcons.ruler, label: "Length", value: form.length),
      Specifications(
          icon: FontAwesomeIcons.userGroup,
          label: "Capacity",
          value: form.capacity.toString()),
      Specifications(
          icon: FontAwesomeIcons.bath,
          label: "Bathrooms",
          value: form.bathrooms.toString()),
      Specifications(
          icon: FontAwesomeIcons.bed, label: "Saterooms", value: "4"),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.responsive.wp(5),
        vertical: widget.responsive.hp(3),
      ),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: widget.responsive.hp(37),
              child: Card(
                elevation: 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: PageView(
                    children: [
                      Image.file(
                        form.cover,
                        fit: BoxFit.cover,
                      ),
                      ...List.generate(
                        form.photos.length,
                        (index) {
                          final photo = form.photos[index];
                          return Image.file(
                            photo,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: widget.responsive.hp(3),
                ),
                Text(
                  form.title,
                  style: widget.fontSize.headline5().copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 5.0),
                const Text("Miami Beach Florida"),
                const SizedBox(height: 5.0),
                Text(
                  "4bed/4bath",
                  style: widget.fontSize.caption(color: Colors.black38),
                ),
                Row(
                  children: [
                    Text("Hosted by Lucy", style: widget.fontSize.bodyText1()),
                    const SizedBox(width: 10.0),
                    const Expanded(
                      child: Text(
                        "Superhost",
                        style: TextStyle(color: Colors.black45),
                      ),
                    ),
                    const CircleAvatar(radius: 30),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: Colors.black38,
                  thickness: 2,
                ),
                const SizedBox(height: 25),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Specifications", style: widget.fontSize.bodyText1()),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          SliverGrid.count(
            childAspectRatio: 2.9,
            crossAxisCount: 2,
            children: List.generate(
              specifications.length,
              (index) => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(specifications[index].icon, color: Colors.grey.shade700,),
                  SizedBox(width: widget.responsive.wp(2)),
                  Text(
                    specifications[index].label,
                    style: widget.fontSize
                        .bodyText1()
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  SizedBox(width: widget.responsive.wp(4)),
                  Text(
                    specifications[index].value,
                    style: widget.fontSize.bodyText1(),
                  ),
                ],
              ),
            ),
          ),
          SliverDividerCustom(),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: widget.responsive.hp(0)),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text("Description", style: widget.fontSize.bodyText1()),
                const SizedBox(height: 15),
                Text(form.description),
              ]),
            ),
          ),
          SliverDividerCustom(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Features", style: widget.fontSize.bodyText1()),
                const SizedBox(height: 15.0)
              ],
            ),
          ),
          FeaturesResume(form: form),
          SliverDividerCustom(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Things to know", style: widget.fontSize.bodyText1()),
                const SizedBox(height: 20.0),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  width: double.infinity,
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        form.thingsToKnow,
                        style: widget.fontSize.subtitle1(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverDividerCustom(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Boat location", style: widget.fontSize.bodyText1()),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: double.infinity,
                  height: widget.responsive.hp(30),
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                          form.mapCoords.latitude, form.mapCoords.longitude),
                      zoom: 17,
                    ),
                    rotateGesturesEnabled: false,
                    scrollGesturesEnabled: false,
                    tiltGesturesEnabled: false,
                    zoomGesturesEnabled: false,
                    // ignore: prefer_collection_literals
                    markers: Set()
                      ..add(
                        Marker(
                          markerId: const MarkerId("current"),
                          position: LatLng(
                            form.mapCoords.latitude,
                            form.mapCoords.longitude,
                          ),
                        ),
                      ),
                  ),
                ),
              ],
            ),
          ),
          SliverDividerCustom(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Cancelation policy", style: widget.fontSize.bodyText1()),
                const SizedBox(height: 15.0),
                _buildSectionPolicy(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSectionPolicy() {
    switch (form.policy) {
      case 0:
        return CardItemPolicy(
          active: form.policy == 0,
          title: "Flexible",
          onClick: () {},
          body: const Text(
            "100% Payout for cancellations made within 24 hours of the booking start time.",
          ),
        );
      case 1:
        return CardItemPolicy(
          active: form.policy == 1,
          title: "Moderate",
          onClick: () {},
          body: Column(
            children: const [
              Text(
                "100% Payout for cancellations made within 2 days of the booking start time.",
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "50% Payout for cancellations made between2-5 days of the booking start time.",
              ),
            ],
          ),
        );
      case 2:
        return CardItemPolicy(
          active: form.policy == 2,
          title: "Stric",
          onClick: () {},
          body: Column(
            children: const [
              Text(
                "100% Payout for cancellations made within 14 days of the booking start time.",
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "50% Payout for cancellations made between 14-30  days of the booking start time.",
              ),
            ],
          ),
        );
      default:
    }
  }
}

class FeaturesResume extends StateFullCustom {
  FeaturesResume({
    Key? key,
    required this.form,
  }) : super(key: key);

  final Yacht form;

  @override
  State<FeaturesResume> createState() => _FeaturesResumeState();
}

class _FeaturesResumeState extends State<FeaturesResume> {
  bool showAll = false;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            crossAxisSpacing: 10.0,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10.0,
            children: List.generate(
              showAll ? widget.form.features.length : 4,
              (index) {
                final allowed = widget.form.features[index];
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(allowed.icon),
                      const SizedBox(height: 5),
                      Text(
                        allowed.name,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: widget.responsive.hp(4))),
          !showAll && widget.form.features.length > 4
              ? SizedBox(
                  width: widget.responsive.wp(56),
                  child: GradientButton(
                    text:
                        "Show all ${widget.form.features.length - 4} features",
                    onPressed: () {
                      setState(
                        () {
                          showAll = true;
                        },
                      );
                    },
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class SliverDividerCustom extends StatelessCustom {
  SliverDividerCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(vertical: responsive.hp(4)),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          const Divider(color: Colors.black38, thickness: 1),
        ]),
      ),
    );
  }
}
