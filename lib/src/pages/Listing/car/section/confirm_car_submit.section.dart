import 'package:brokr/src/blocs/listing_car.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/car/section/policy_cancellation.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/cofirm.section.dart';

class ConfirmCarSubmitSection extends StateFullCustom {
  final ListingCarBloc bloc;

  ConfirmCarSubmitSection({super.key, required this.bloc});

  @override
  State<ConfirmCarSubmitSection> createState() =>
      _ConfirmCarSubmitSectionState();
}

class _ConfirmCarSubmitSectionState extends State<ConfirmCarSubmitSection> {
  late Car form;

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
