import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/components/checkbox/custom_checkbox.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/building/section/prepare_trip.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/duration.section.dart';

class TripAcceptShortestTimeSection extends StatelessCustom {
  final ListingBuildingBloc bloc;
  TripAcceptShortestTimeSection({
    super.key,
    required this.bloc,
  });

  final List<ItemKeyValue<int>> hours = [
    ItemKeyValue(label: "1 night", value: 24, recommend: true),
    ItemKeyValue(label: "2 nights", value: 48),
    ItemKeyValue(label: "3 nights", value: 72),
    ItemKeyValue(label: "5 nights", value: 120),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.acceptTripTimeStream,
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
                          onClick: bloc.addAcceptTripTime,
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
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: responsive.hp(2)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "2 nights min for bookings starting on Fri or Sat",
                          style: fontSize.subtitle2().copyWith(fontWeight: FontWeight.w600),
                        ),
                        CustomCheckbox(
                          value: false,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text(
                           "3 nights min for bookings starting on Fri or Sat",
                           style: fontSize.subtitle2().copyWith(fontWeight: FontWeight.w600),
                         ),
                         CustomCheckbox(
                           value: false,
                           onChanged: (value) {},
                         )
                       ],
                     ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
