import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../widgets/text_align_left_widget.dart';

enum PayWith { credit, apple, google }

class PayWidget extends StatefulWidget {
  const PayWidget({super.key});

  @override
  State<PayWidget> createState() => _PayWidgetState();
}

class _PayWidgetState extends State<PayWidget> {
  final GuestHomeController guestHomeController = Get.find();
  PayWith? payWith;

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
          leading: Container(
        
              height: 32.5,
              width: 32.5,
              child:
                  SvgPicture.asset("assets/icons/credit_card.svg",   
                  fit: BoxFit.fill,
                     height: 32.5,
              width: 32.5,)),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          trailing: Radio<PayWith>(
              activeColor: ThemeUtils.colorPurple,
              value: PayWith.credit,
              groupValue: payWith,
              onChanged: (PayWith? locale) async {
                payWith = locale;

                setState(() {});
              }),
          title: const Text(
            "Credit or Debit Card",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: Container(
                height: 32.5,
              width: 32.5,
              child: SvgPicture.asset("assets/icons/apple_pay.svg",      height: 32.5,
              width: 32.5,)),
          trailing: Radio<PayWith>(
              activeColor: ThemeUtils.colorPurple,
              value: PayWith.apple,
              groupValue: payWith,
              onChanged: (PayWith? locale) async {
                payWith = locale;

                setState(() {});
              }),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Apple Pay",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: Container(
                height: 32.5,
              width: 32.5,
              child:
                  SvgPicture.asset("assets/icons/google_pay.svg",      height: 32.5,
              width: 32.5,)),
          trailing: Radio<PayWith>(
              activeColor: ThemeUtils.colorPurple,
              value: PayWith.google,
              groupValue: payWith,
              onChanged: (PayWith? locale) async {
                payWith = locale;

                setState(() {});
              }),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Google Pay",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: Container(
              height: 32.5,
              width: 32.5,
              child: SvgPicture.asset("assets/icons/promocode.svg",     height: 32.5,
              width: 32.5,)),
          trailing: InkWell(
            onTap: () async {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild: guestHomeController.bottomSheests.promocode(),
                  height: Get.context!.height * 0.35);
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Add",
                    style: TextStyle(
                        color: ThemeUtils.colorPurple,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ]),
          ),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Promo code",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
        ListTile(
          minLeadingWidth: 0.0,
          leading: Container(
                height: 32.5,
              width: 32.5,
              child: SvgPicture.asset("assets/icons/travel.svg",    height: 32.5,
              width: 32.5,)),
          trailing: InkWell(
            onTap: () async {
              var response = await GuestBottomSheests.buildshowGeneralDialog(
                  context: context,
                  widgetChild:
                      guestHomeController.bottomSheests.travelCredits(),
                  height: Get.context!.height * 0.35);
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Redeem",
                    style: TextStyle(
                        color: ThemeUtils.colorPurple,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 20,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                ]),
          ),
          contentPadding: const EdgeInsets.all(0.0),
          minVerticalPadding: 0.0,
          title: const Text(
            "Travel credit",
            style: TextStyle(fontSize: 14.0),
          ),
        ),
       
      ],
    );
  }
}
