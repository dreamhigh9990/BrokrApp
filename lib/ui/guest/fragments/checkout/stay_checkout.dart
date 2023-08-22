
import 'package:flutter/material.dart';
import '../../../../models/policy_model.dart';
import '../../../widgets/chekout/stay_checkout_widget.dart';

class StayCheckout extends StatefulWidget {
  const StayCheckout({super.key});

  @override
  State createState() => _StayCheckout();
}

class _StayCheckout extends State<StayCheckout> {

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
              StayCheckoutWidget(
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
                days: 3,
                tax: 9.5,
                dayPrice: 500,
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
