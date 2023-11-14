import 'package:brokr/src/blocs/listing_car.bloc.dart';
import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/checkbox/custom_checkbox.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/custom_slider_thumb_circle.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GuestsUnitSection extends StateFullCustom {
  final ListingBuildingBloc bloc;
  GuestsUnitSection({super.key, required this.bloc});

  @override
  State<GuestsUnitSection> createState() => _GuestsUnitSectionState();
}

class _GuestsUnitSectionState extends State<GuestsUnitSection> {
  int availability = 0;

  @override
  void initState() {
    super.initState();
    widget.bloc.defineOptionAvailableBed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.responsive.hp(5)),
      margin: EdgeInsets.symmetric(horizontal: widget.responsive.wp(5)),
      child: SingleChildScrollView(
        child: StreamBuilder(
          stream: widget.bloc.availableStream,
          builder: (_, AsyncSnapshot<AvailableDays> snapshot) {
            return Column(
              children: [
                CardItemPolicy(
                  active: snapshot.data?.option == 0,
                  title: "Bedroom 1",
                  onClick: () => widget.bloc.defineOptionAvailableBed(0),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Select type *",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.responsive.hp(3)),
                CardItemPolicy(
                  active: snapshot.data?.option == 1,
                  title: "Bedroom 2",
                  onClick: () => widget.bloc.defineOptionAvailableBed(1),
                  body: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1 king size bed (approx. 180 x 200 cm)",
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                            SizedBox(height: widget.responsive.hp(2)),
                            Text(
                              "Sleeps 2",
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                            SizedBox(height: widget.responsive.hp(2)),
                            Text(
                              "1 Twin bed (approx. 90 x 200 cm)",
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                            SizedBox(height: widget.responsive.hp(2)),
                            Text(
                              "Sleeps 2",
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1 Double bed (approx. 180 x 200 cm)",
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                            SizedBox(height: widget.responsive.hp(2)),
                            Text(
                              "Sleeps 2",
                              style: TextStyle(color: Colors.black.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.responsive.hp(3)),
                CardItemPolicy(
                  active: snapshot.data?.option == 2,
                  title: "Bedroom 2",
                  onClick: () => widget.bloc.defineOptionAvailableBed(2),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.kingsizebedStream,
                        "King size bed (approx. 180 x 200 cm)",
                        widget.bloc.specificationsBloc.addKingsizebed,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.doublebedStream,
                        "Double bed (approx. 140 x 200 cm)",
                        widget.bloc.specificationsBloc.addDoublebed,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.singlebedStream,
                        "Queen size bed (approx. 160 x 200 cm)",
                        widget.bloc.specificationsBloc.addSinglebed,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.passengerStream,
                        "Single bed (approx. 90 x 200 cm)",
                        widget.bloc.specificationsBloc.addPassenger,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.twinbedStream,
                        "Twin bed (approx. 90 x 200 cm)",
                        widget.bloc.specificationsBloc.addTwinbed,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.couchsofaStream,
                        "Couch/Sofa",
                        widget.bloc.specificationsBloc.addCouchsofa,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.bunkbedStream,
                        "Bunk bed",
                        widget.bloc.specificationsBloc.addBunkbed,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.singlebedsofaStream,
                        "Single bed sofa",
                        widget.bloc.specificationsBloc.addSinglebedsofa,
                      ),
                      _buildIncrementDecrement(
                        widget.bloc.specificationsBloc.doublebedsofaStream,
                        "Doueble bed sofa",
                        widget.bloc.specificationsBloc.addDoublebedsofa,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: widget.responsive.hp(0)),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildIncrementDecrement(
      Stream<int> stream, String label, Function(int) add,
      {limit}) {
    return StreamBuilder(
      stream: stream,
      initialData: 0,
      builder: (_, AsyncSnapshot<int> snapshot) {
        return IncrementDecrement(
          name: label,
          value: snapshot.data ?? 0,
          onChanged: add,
          limit: limit,
        );
      },
    );
  }
}

class IncrementDecrement extends StateFullCustom {
  final String name;
  final int? limit;
  final int value;
  final Function(int) onChanged;
  IncrementDecrement(
      {super.key,
        this.limit,
        required this.name,
        required this.value,
        required this.onChanged});

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.responsive.hp(4.8)),
      child: Row(
        children: [
          Expanded(
            child: Text(widget.name, style: widget.fontSize.bodyText1()),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: widget.value == 0
                    ? null
                    : () {
                  widget.onChanged(widget.value - 1);
                },
                child: AnimatedOpacity(
                  opacity: widget.value == 0 ? 0.2 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: const FaIcon(
                      FontAwesomeIcons.minus,
                      size: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(width: widget.responsive.wp(3)),
              Text(
                "${widget.value}",
                style: widget.fontSize.bodyText1(),
              ),
              SizedBox(width: widget.responsive.wp(3)),
              GestureDetector(
                onTap: widget.limit != widget.value
                    ? () {
                  widget.onChanged(widget.value + 1);
                }
                    : null,
                child: AnimatedOpacity(
                  opacity: widget.limit != widget.value ? 1 : 0.2,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.plus,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CardItemPolicy extends StatelessCustom {
  CardItemPolicy({
    Key? key,
    required this.active,
    required this.title,
    required this.onClick,
    required this.body,
  }) : super(key: key);

  final bool active;
  final String title;
  final Widget body;
  final GestureTapCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: responsive.wp(4)),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8.0),
                ),
                gradient: active
                    ? LinearGradient(
                  colors: [
                    colorsTheme.primary,
                    colorsTheme.secondary,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.topRight,
                  // end: const Alignment(1.2, 0),
                  stops: const [0.35, .7],
                  transform: const GradientRotation(05),
                )
                    : null,
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(width: responsive.wp(2)),
                    Expanded(
                      child: Text(
                        title,
                        style: fontSize.headline5(
                          color: active ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: active ? Icon(
                        Icons.delete_outline,
                        size: 20.0,
                        color: Colors.white,
                      ) : Icon(
                        Icons.delete_outline,
                        size: 20.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: responsive.wp(2)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: active ? const FaIcon(
                        FontAwesomeIcons.angleDown,
                        size: 15,
                        color: Colors.white,
                      ) : const FaIcon(
                        FontAwesomeIcons.angleDown,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              color: Colors.black.withOpacity(.2),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: responsive.wp(5),
                vertical: responsive.hp(4),
              ),
              width: double.infinity,
              child: body,
            ),
          ],
        ),
      ),
    );
  }
}