import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/building/section/building_info.section.dart';

class ThingsKnowSection extends StatelessCustom {
  final ListingBuildingBloc bloc;

  ThingsKnowSection({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: responsive.hp(5)),
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
      child: InputCustomOutline(
        onChanged: bloc.addThingsToKnow,
        maxLength: 1000,
        maxLines: 8,
        buildCounter: (context,
            {required currentLength, required isFocused, maxLength}) {
          var total = maxLength! - currentLength;
          return Text("$total characters remaining");
        },
      ),
    );
  }
}
