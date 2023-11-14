import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../widgets/text_align_left_widget.dart';

class PayWidget extends StatelessWidget {
  const PayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextAlignLeft(title: "Pay with"),
        const SizedBox(
          height: 5.0,
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: SvgPicture.asset("assets/icons/credit_card.svg", width: 30),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          trailing: const Radio(value: false, groupValue: {}, onChanged: null),
          title: const Text(
            "Credit or Debit Card",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: SvgPicture.asset("assets/icons/apple_pay.svg", width: 30),
          trailing: const Radio(value: false, groupValue: {}, onChanged: null),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Apple Pay",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: SvgPicture.asset("assets/icons/google_pay.svg", width: 30),
          trailing: const Radio(value: false, groupValue: {}, onChanged: null),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Google Pay",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
