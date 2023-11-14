import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/duration.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/policy.section.dart';

class MultipleBookingSection extends StateFullCustom {
  final ListingYachtBloc bloc;
  MultipleBookingSection({
    super.key,
    required this.bloc,
  });

  @override
  State<MultipleBookingSection> createState() => _MultipleBookingSection();
}

class _MultipleBookingSection extends State<MultipleBookingSection> {
  final List<ItemKeyValue<int>> options = [
    ItemKeyValue(label: "30 minutes", value: 30),
    ItemKeyValue(label: "1 hours", value: 60),
    ItemKeyValue(label: "2 hours", value: 120),
    ItemKeyValue(label: "3 hours", value: 180),
  ];

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompositionValue<int>>(
      stream: widget.bloc.mergeMultiBooking,
      initialData: CompositionValue(a: true, b: 0),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          padding: EdgeInsets.only(top: widget.responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: widget.responsive.wp(5)),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    CardItemPolicy(
                      active: !snapshot.data.a,
                      title: "No",
                      onClick: () {
                        widget.bloc.addMultiBooking(false);
                      },
                      body: const Text(
                        "This boat can only be booked once a day",
                      ),
                    ),
                    CardItemPolicy(
                      active: snapshot.data.a,
                      title: "Yes",
                      onClick: () {
                        widget.bloc.addMultiBooking(true);
                      },
                      body: const Text(
                        "How much time you need to prepare in between trips?",
                      ),
                    )
                  ],
                ),
              ),
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
                      value: snapshot.data.b == options[index].value,
                      add: widget.bloc.addtimeDelayBooking,
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
