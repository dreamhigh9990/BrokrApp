import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/widgets/text_align_left_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/theme_utils.dart';
import 'pay_widget.dart';

class CommonsWidget extends StatelessWidget {
  bool? showPayWith;
  CommonsWidget({
    super.key,
    this.showPayWith = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        TextAlignLeft(title: "How would you like to pay?"),
        const ListTile(
          minLeadingWidth: 0.0,
          contentPadding: EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          trailing: Radio(value: false, groupValue: {}, onChanged: null),
          title: AutoSizeText(
            "Pay in full",
            style: TextStyle(fontSize: 15.0),
          ),
          subtitle: AutoSizeText(
            "Pay the total amount \$4,800.00 and you’re all set.",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        const ListTile(
          minLeadingWidth: 0.0,
          trailing: Radio(value: false, groupValue: {}, onChanged: null),
          contentPadding: EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: AutoSizeText(
            "Pay half now, rest later",
            style: TextStyle(fontSize: 15.0),
          ),
          subtitle: AutoSizeText(
            "Pay \$2,400.00 now and rest (\$2,400.00) will be automatically charged to the same payment method on Oct, 05, 2022 No extra fees. ",
            style: TextStyle(fontSize: 12.0),
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
        if (showPayWith!) ...{
          const PayWidget(),
        },
        TextAlignLeft(title: "Attached documents"),
        ListTile(
          leading: SvgPicture.asset("assets/icons/clippers.svg", width: 30),
          minLeadingWidth: 0.0,
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Driver’s License",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icons/clippers.svg", width: 30),
          minLeadingWidth: 0.0,
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Insurance card",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        const SizedBox(
          height: 20.0,
        ),
        InputDecorator(
          decoration: ThemeUtils.inputDecoration(
              fontWeight: FontWeight.normal,
              labelText: "Leave a message to the Host",
              isPadding: ThemeUtils.paddingLeftAndRight),
          child: const TextField(
            textInputAction: TextInputAction.go,
            maxLines: 6,
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          "Your booking won’t be confirmed until the host accepts your requests (within 24 hours) No charge will be made until then. ",
          textAlign: TextAlign.justify,
        ),
        const SizedBox(
          height: 40.0,
        ),
        RichText(
          text: const TextSpan(
            text: 'By selecting the button below, I agree to the ',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                  text:
                      "Host's Vehicle Rules, Brokr's Rebooking and Refund Policy",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black)),
              TextSpan(
                  text: " and that Brokr can",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black)),
              TextSpan(
                  text:
                      " I’m responsible for damage. I agree to pay the total amount shown if the Host accepts my booking request",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.black)),
            ],
          ),
        ),
        const SizedBox(
          height: 40.0,
        ),
      ],
    );
  }
}
