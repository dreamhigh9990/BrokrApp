import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/pages/Listing/yacht/section/duration.section.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class PrepareTripHourSection extends StatelessCustom {
  final ListingBuildingBloc bloc;
  PrepareTripHourSection({
    super.key,
    required this.bloc,
  });

  final List<ItemKeyValue<int>> hours = [
    ItemKeyValue(label: "1 hour", value: 1),
    ItemKeyValue(label: "2 hours", value: 2),
    ItemKeyValue(label: "3 hours", value: 3,recommend: true),
    ItemKeyValue(label: "12 hours", value: 12),
    ItemKeyValue(label: "1 day", value: 24),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.prepareTripHourStream,
      initialData: -1,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(
            top: responsive.hp(3),
            left: responsive.wp(5),
            right: responsive.wp(5),
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (_, index) {
                    final item = hours[index];
                    return Column(
                      children: [
                        ItemSelect(
                          item: item,
                          onClick: bloc.addPrepareTripHour,
                          value: item.value,
                          active: item.value == snapshot.data,
                        ),
                        SizedBox(
                          height: responsive.hp(3),
                        ),
                      ],
                    );
                  },
                  childCount: hours.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ItemSelect extends StatelessCustom {
  ItemSelect({
    Key? key,
    required this.item,
    required this.onClick,
    required this.value,
    required this.active,
  }) : super(key: key);

  final ItemKeyValue<int> item;
  final Function(int) onClick;
  final int value;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(value),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    item.label,
                    style: fontSize.bodyText1(),
                  ),
                  SizedBox(
                    width: responsive.wp(10),
                  ),
                  item.recommend == true
                      ? Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xffFFB134), Color(0xffFF3A7E)],
                            ),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Center(
                            child: Text(
                              "RECOMMENDED",
                              style: fontSize.bodyText2(),
                            ),
                          ),
                        )
                      : Container(),
                ],
              ),
              Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: RadialGradient(
                    colors: [
                      active ? colorsTheme.primary : Colors.grey.shade200,
                      active ? colorsTheme.secondary : Colors.grey.shade300,
                    ],
                  ),
                ),
                child: Center(
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: active ? Colors.white : colorsTheme.primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
