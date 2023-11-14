import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/checkbox/custom_checkbox.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class ItemKeyValue<T> {
  String label;
  T value;
  bool? recommend;

  ItemKeyValue({
    required this.label,
    required this.value,
    this.recommend,
  });
}

class DurationSection extends StateFullCustom {
  final ListingYachtBloc bloc;
  DurationSection({
    super.key,
    required this.bloc,
  });

  @override
  State<DurationSection> createState() => _DurationSectionState();
}

class _DurationSectionState extends State<DurationSection> {
  final List<ItemKeyValue<String>> options = [
    ItemKeyValue(label: "Select all", value: "all"),
    ItemKeyValue(label: "2 hours", value: "2"),
    ItemKeyValue(label: "4 hours", value: "4"),
    ItemKeyValue(label: "6 hours", value: "6"),
    ItemKeyValue(label: "8 hours", value: "8"),
    ItemKeyValue(label: "Multi-days", value: "multi"),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.bloc.durationStream,
      initialData: "",
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
                    (index) => OptionCheckbox<String>(
                      option: options[index],
                      value: snapshot.data == options[index].value ||
                          snapshot.data == "all",
                      add: widget.bloc.addDuration,
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

class OptionCheckbox<T> extends StatelessCustom {
  final ItemKeyValue<T> option;
  final bool value;
  final Function(T) add;

  OptionCheckbox({
    required this.option,
    required this.value,
    required this.add,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: responsive.wp(3)),
        child: Row(
          children: [
            CustomCheckbox(
              value: value,
              onChanged: ((value) {
                add( option.value);
              }),
            ),
            SizedBox(
              width: responsive.wp(4),
            ),
            Text(option.label),
          ],
        ),
      ),
    );
  }
}
