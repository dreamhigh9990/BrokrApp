import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/duration.section.dart';

class PrepareInternationalTripSection extends StateFullCustom {
  final ListingYachtBloc bloc;
  PrepareInternationalTripSection({
    super.key,
    required this.bloc,
  });

  @override
  State<PrepareInternationalTripSection> createState() =>
      _PrepareInternationalTripSectionState();
}

class _PrepareInternationalTripSectionState
    extends State<PrepareInternationalTripSection> {
  final List<ItemKeyValue<int>> options = [
    ItemKeyValue(label: "4 hours", value: 4),
    ItemKeyValue(label: "8 hours", value: 8),
    ItemKeyValue(label: "12 hours", value: 12),
    ItemKeyValue(label: "1 day", value: 24),
    ItemKeyValue(label: "2 days", value: 48),
    ItemKeyValue(label: "3 days", value: 72),
    ItemKeyValue(label: "4 days", value: 96),
    ItemKeyValue(label: "5-7 days", value: 168),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.timeITripStream,
      initialData: 0,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(top: widget.responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: widget.responsive.wp(5)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.responsive.wp(2),
                  vertical: widget.responsive.hp(3),
                ),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.9,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(
                    options.length,
                    (index) => OptionCheckbox<int>(
                      option: options[index],
                      value: snapshot.data == options[index].value,
                      add: widget.bloc.addTimeITrip,
                    ),
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
