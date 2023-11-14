import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class PolicySection extends StateFullCustom {
  final ListingYachtBloc bloc;
  PolicySection({Key? key, required this.bloc}) : super(key: key);
  @override
  PolicySectionState createState() => PolicySectionState();
}

class PolicySectionState extends State<PolicySection> {
  int policySelected = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: widget.responsive.hp(3)),
        margin: EdgeInsets.symmetric(
          horizontal: widget.responsive.wp(5),
        ),
        child: Column(
          children: [
            CardItemPolicy(
              active: policySelected == 0,
              title: "Flexible",
              onClick: () => setState(() {
                policySelected = 0;
                widget.bloc.addPolicyCancelation(0);
              }),
              body: const Text(
                "100% Payout for cancellations made within 24 hours of the booking start time.",
              ),
            ),
            SizedBox(height: widget.responsive.hp(4)),
            CardItemPolicy(
              active: policySelected == 1,
              title: "Moderate",
              onClick: () => setState(() {
                widget.bloc.addPolicyCancelation(1);
                policySelected = 1;
              }),
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
            ),
            SizedBox(height: widget.responsive.hp(4)),
            CardItemPolicy(
              active: policySelected == 2,
              title: "Stric",
              onClick: () => setState(() {
                widget.bloc.addPolicyCancelation(2);
                policySelected = 2;
              }),
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
            ),
          ],
        ),
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
                    Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: RadialGradient(
                          colors: [
                            active
                                ? const Color(0xffFFB134)
                                : Colors.grey.shade200,
                            active
                                ? const Color(0xffFF3A7E)
                                : Colors.grey.shade300,
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
                    SizedBox(width: responsive.wp(5)),
                    Text(
                      title,
                      style: fontSize.headline5(
                        color: active ? Colors.white : Colors.black,
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
