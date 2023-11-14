import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/pages/Listing/building/section/allowed.section.dart';
import 'package:brokr/src/pages/Listing/building/section/policy_cancellation.section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:brokr/src/pages/Listing/yacht/section/cofirm.section.dart';

class ConfirmBuildingSubmitSection extends StateFullCustom {
  final ListingBuildingBloc bloc;

  ConfirmBuildingSubmitSection({super.key, required this.bloc});

  @override
  State<ConfirmBuildingSubmitSection> createState() =>
      _ConfirmBuildingSubmitSectionState();
}

class _ConfirmBuildingSubmitSectionState extends State<ConfirmBuildingSubmitSection> {
  late Building form;

  @override
  void initState() {
    super.initState();
    form = widget.bloc.getValueForSubmit();
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
              child:
              Card(
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
          PlaceFeaturesResume(form: form),
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

class PlaceFeaturesResume extends StateFullCustom {
  PlaceFeaturesResume({
    Key? key,
    required this.form,
  }) : super(key: key);

  final Building form;

  @override
  State<PlaceFeaturesResume> createState() => _PlaceFeaturesResumeState();
}

class _PlaceFeaturesResumeState extends State<PlaceFeaturesResume> {
  bool showAll = true;

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