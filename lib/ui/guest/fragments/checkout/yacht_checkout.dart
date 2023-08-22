
import 'package:flutter/material.dart';
import '../../../../models/policy_model.dart';
import '../../../widgets/chekout/yacht_checkout_widget.dart';

class YachtCheckout extends StatefulWidget {
  const YachtCheckout({super.key});

  @override
  State createState() => _YachtCheckout();
}

class _YachtCheckout extends State<YachtCheckout> {
  int groupValue = 0;
  PolicyModel policy = PolicyModel('Friendly', 'legalStuff',
      'assets/icons/search_icon.svg', 'Oct 20, 2022', true);

//// request book
  requestBooking() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [
              YachtCheckoutWidget(
                title: 'Luxury Villa 5bed/6bath waterfront',
                owner: "Luis",
                rating: 4.5,
                image: 'https://picsum.photos/500',
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                description: "asdsadsads",
                startDate: 'Sat, Oct 08, 10:30 AM',
                endDate: 'Sat, Oct 08, 10:30 AM',
                guests: 15,
                brokrFee: 10.0,
                gratuity: 15,
                hours: 9,
                tax: 9.5,
                hourPrice: 500,
                lateFee: 600,
                policy: policy,
                requestBook: requestBooking,
              )
            ],
          ),
        ],
      ),
    );
  }
}
