import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/checkbox/custom_checkbox.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/custom_slider_thumb_circle.dart';
import 'package:brokr/src/pages/Listing/yacht/section/policy.section.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class AvailableSection extends StateFullCustom {
  final ListingYachtBloc bloc;
  AvailableSection({super.key, required this.bloc});

  @override
  State<AvailableSection> createState() => _AvailableSectionState();
}

class _AvailableSectionState extends State<AvailableSection> {
  int availability = 0;

  @override
  void initState() {
    super.initState();
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
                  title: "Default availability",
                  onClick: () => widget.bloc.defineOptionAvailableDay(0),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Your boat will be available"),
                      SizedBox(height: widget.responsive.hp(4)),
                      Text(
                        "Monday to Sunday, from 8:00 AM to 6:00 PM",
                        style: widget.fontSize.bodyText1(),
                      )
                    ],
                  ),
                ),
                SizedBox(height: widget.responsive.hp(3)),
                CardItemPolicy(
                  active: snapshot.data?.option == 1,
                  title: "Custom availability",
                  onClick: () => widget.bloc.defineOptionAvailableDay(1),
                  body: const Text("Customize your available days and hours"),
                ),
                SizedBox(height: widget.responsive.hp(6)),
                snapshot.data?.option == 1
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          children: [
                            ...?snapshot.data?.days.entries.map((e) {
                              return Column(
                                children: [
                                  Card(
                                    elevation: 6,
                                    child: CardDay(
                                      dayLabel: e.key,
                                      day: e.value,
                                      onChange: widget.bloc.addDayConfig,
                                    ),
                                  ),
                                  SizedBox(height: widget.responsive.hp(2)),
                                ],
                              );
                            }).toList(),
                          ],
                        ),
                      )
                    : Container(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CardDay extends StateFullCustom {
  final String dayLabel;
  final Day day;
  final Function(Day, String) onChange;
  CardDay({
    super.key,
    required this.dayLabel,
    required this.day,
    required this.onChange,
  });

  @override
  State<CardDay> createState() => _CardDayState();
}

class _CardDayState extends State<CardDay> {
  bool isExpanded = false;
  late ExpandedTileController _controller;

  bool monday = true;

  @override
  void initState() {
    _controller = ExpandedTileController();
    _controller.addListener(() {
      setState(() {
        isExpanded = _controller.isExpanded;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandedTile(
      enabled: widget.day.active,
      theme: ExpandedTileThemeData(
        headerColor: isExpanded ? widget.colorsTheme.primary : Colors.white,
        contentBackgroundColor: Colors.white,
      ),
      controller: _controller,
      content: Column(
        children: [
          Row(
            children: [
              const Text("From"),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor:
                        widget.colorsTheme.textOpacity.withOpacity(.3),
                    inactiveTrackColor: widget.colorsTheme.primary,
                    trackHeight: 3.0,
                    thumbShape: const CustomSliderThumbCircle(
                      thumbRadius: 48 * .4,
                      min: 0,
                      max: 1440,
                    ),
                    overlayColor: Colors.white.withOpacity(1),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                    value: widget.day.from,
                    min: 0,
                    max: 1440,
                    divisions: 48,
                    onChanged: (value) {
                     final stateDay = widget.day;
                      widget.onChange(
                        Day(
                          active: stateDay.active,
                          from: value,
                          until: stateDay.until,
                        ),
                        widget.dayLabel,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text("Until"),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor:
                        widget.colorsTheme.textOpacity.withOpacity(.3),
                    inactiveTrackColor: widget.colorsTheme.primary,
                    trackHeight: 3.0,
                    thumbShape: const CustomSliderThumbCircle(
                      thumbRadius: 48 * .4,
                      min: 0,
                      max: 1440,
                    ),
                    overlayColor: Colors.white.withOpacity(1),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                    value: widget.day.until!,
                    min: 0,
                    max: 1440,
                    divisions: 48,
                    onChanged: (value) {
                      final stateDay = widget.day;
                      widget.onChange(
                        Day(
                          active: stateDay.active,
                          from: stateDay.from,
                          until: value,
                        ),
                        widget.dayLabel,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      title: Row(
        children: [
          CustomCheckbox(
            value: widget.day.active,
            onChanged: (value) {
              if (!value!) {
                _controller.collapse();
              }
              widget.onChange(
                Day(
                  active: value,
                  from: widget.day.from,
                  until: widget.day.until,
                ),
                widget.dayLabel,
              );
            },
          ),
          const SizedBox(width: 15.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.dayLabel,
                style: widget.fontSize
                    .headline5(color: isExpanded ? Colors.white : Colors.black),
              ),
              Text(
                "${getValue(widget.day.from)} - ${getValue(widget.day.until!)}",
                style:
                    TextStyle(color: isExpanded ? Colors.white : Colors.black),
              )
            ],
          ),
        ],
      ),
    );
  }

  String getValue(double value) {
    final time = durationToString(value.toInt());
    return time;
  }

  String durationToString(int minutes) {
    var d = Duration(minutes: minutes);
    List<String> parts = d.toString().split(':');
    var hour = parts[0];
    final prefix = int.parse(hour) >= 12 ? "PM" : "AM";
    hour = int.parse(hour) > 12 ? (int.parse(hour) - 12).toString() : hour;
    return '${hour.padLeft(2, '0')}:${parts[1].padLeft(2, '0')} $prefix';
  }
}
