import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/ui/widgets/text_align_left_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../widgets/booking_detail/locale/list_tile_widget.dart';
import 'pay_widget.dart';

enum LikePay {
  total,
  half,
}

class CommonsWidget extends StatefulWidget {
  bool? showPayWith;
  CommonsWidget({
    super.key,
    this.showPayWith = true,
  });

  @override
  State<CommonsWidget> createState() => _CommonsWidgetState();
}

class _CommonsWidgetState extends State<CommonsWidget> {
  LikePay? likePay;
  final GuestHomeController guestHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        TextAlignLeft(title: "How would you like to pay?"),
        ListTile(
          minLeadingWidth: 0.0,
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          trailing: Radio<LikePay>(
              activeColor: ThemeUtils.colorPurple,
              value: LikePay.total,
              groupValue: likePay,
              onChanged: (LikePay? locale) async {
                likePay = locale;

                setState(() {});
              }),
          title: const AutoSizeText(
            "Pay total amount",
            style: TextStyle(fontSize: 15.0),
          ),
          subtitle: const AutoSizeText(
            "Pay the total amount \$4,800.00 and you’re all set.",
            style: TextStyle(fontSize: 12.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          trailing: Radio<LikePay>(
              activeColor: ThemeUtils.colorPurple,
              value: LikePay.half,
              groupValue: likePay,
              onChanged: (LikePay? locale) async {
                likePay = locale;

                setState(() {});
              }),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const AutoSizeText(
            "Pay half now, rest later",
            style: TextStyle(fontSize: 15.0),
          ),
          subtitle: const AutoSizeText(
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
        if (widget.showPayWith!) ...{
          const PayWidget(),
        },
        ListTileColumnWidget(
          pressed: () async {
            var response = await GuestBottomSheests.buildshowGeneralDialog(
                context: context,
                widgetChild:
                    guestHomeController.bottomSheests.cancellationPolicy(),
                height: Get.context!.height * 0.5);
          },
          title: "Cancellation Policy",
          subtitle: "Flexible",
          body: "Free cancellation and full refund before Nov 5, 11:00 AM",
          icon: "cancel_policy",
        ),
        ThemeUtils.dividerGrey,
        const SizedBox(
          height: 10.0,
        ),
        TextAlignLeft(title: "Attached documents"),
        ListTile(
          leading: Container(
              height: 30,
              width: 30.0,
              child: SvgPicture.asset("assets/icons/clippers.svg", width: 30)),
          minLeadingWidth: 0.0,
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Driver’s License",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          leading: Container(
              height: 30,
              width: 30.0,
              child: SvgPicture.asset("assets/icons/clippers.svg", width: 30)),
          minLeadingWidth: 0.0,
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0.0,
          title: const Text(
            "Insurance card",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ThemeUtils.dividerGrey,
        const SizedBox(
          height: 20.0,
        ),
        TextAlignLeft(title: "Message Host"),
        const SizedBox(
          height: 20.0,
        ),
        InputDecorator(
          decoration: ThemeUtils.inputDecoration(
              fontWeight: FontWeight.normal,
              labelText: "Leave a message to the Host",
              isPadding: ThemeUtils.paddingLeftAndRight),
          child: const TextField(
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
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
