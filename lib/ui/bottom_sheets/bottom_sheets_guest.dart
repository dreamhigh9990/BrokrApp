import 'package:brokr/ui/bottom_sheets/hours_list_widget.dart';
import 'package:brokr/ui/bottom_sheets/widgets/header_bar_widget.dart';
import 'package:brokr/ui/commons/pages/message_confirmd_page.dart';
import 'package:brokr/ui/guest/pages/home/fragments/trips/car/widgets/price_details_page.dart';
import 'package:brokr/ui/guest/pages/home/fragments/trips/car/widgets/trip_cancelled.dart';
import 'package:brokr/ui/widgets/text_align_left_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../models/super_model.dart';
import '../guest/fragments/booking_detail/widgets/bottom_bar_widget.dart';
import '../guest/fragments/filters/widgets/bottom_bar_widget.dart';
import '../guest/pages/home/guest_home_controller.dart';
import '../widgets/bottom_bar_container_full_widget.dart';
import '../widgets/item_card.dart';
import 'calendar_months_widget.dart';
import '../widgets/normal_button.dart';
import 'guest_widget.dart';
import 'number_list_widget.dart';
import 'widgets/textfield_location_widget.dart';

class GuestBottomSheests {
  //where and where bottom sheet

  static buildBottomSheet({
    required BuildContext context,
    required Widget child,
    required double height,
    required Color color,
    // required EdgeInsets padding,
  }) async {
    return await showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            child: SafeArea(
              child: Container(
                //  padding: padding,
                height: height,
                width: Get.context!.width,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(40)),
                child: child,
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
        }

        return AnimatedBuilder(
          animation: anim,
          builder: (_, child) {
            return FractionalTranslation(
              translation: tween.evaluate(anim),
              child: Opacity(
                opacity: anim.value,
                child: child,
              ),
            );
          },
          child: child,
        );
      },
    );
  }

  Widget changeTrip(
    GuestHomeController guestHomeController, {
    required Function getBackFunction,
    String pickupDate = "22/11/2023",
    String returnDate = "25/11/2023",
    DateTime? start,
    DateTime? end,
    List<HourModel>? listStart,
    List<HourModel>? listEnd,
  }) {
    listStart = HourModel.createList();
    listEnd = HourModel.createList();
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      HeaderBarWidget(
          title: "Select Dates",
          radius: true,
          functionClear: () {
            start = null;
            end = null;
          }),
      Padding(
        padding: ThemeUtils.paddingScaffoldx05,
        child: Text(
          "Current trip 3 days",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      containerDates(),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      GetBuilder<GuestHomeController>(
          id: "calendar_stays",
          builder: (__) => SizedBox(
                height: Get.context!.height * 0.39,
                child: DatePickerCustom(
                  singleSelection: false,
                  callback: (String startlocale, String endlocale,
                      DateTime starDateTime, DateTime endDateTime) {
                    pickupDate = (startlocale);
                    returnDate = (endlocale);
                    start = starDateTime;
                    end = endDateTime;
                    print(pickupDate);
                    print(returnDate);

                    guestHomeController.updateWidgetGlobal("headers-dates");
                  },
                ),
              )),
      const SizedBox(
        height: 20.0,
      ),
      containerDates(),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      const SizedBox(
        height: 10.0,
      ),
      GetBuilder<GuestHomeController>(
        id: "star_car",
        builder: (__) => Container(
            padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
            ),
            height: 40,
            width: Get.context!.width,
            child: Row(
              children: [
                Text("Start",
                    style: TextStyle(
                        fontFamily: ThemeUtils.interRegular,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: HoursListWidget(
                    list: listStart!,
                    onchanged: (HourModel value) {},
                  ),
                ),
              ],
            )),
      ),
      const SizedBox(
        height: 10.0,
      ),
      GetBuilder<GuestHomeController>(
          id: "star_car",
          builder: (__) => Container(
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              height: 40,
              width: Get.context!.width,
              child: Row(
                children: [
                  Text("End",
                      style: TextStyle(
                          fontFamily: ThemeUtils.interRegular,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: HoursListWidget(
                      list: listEnd!,
                      onchanged: (HourModel value) {},
                    ),
                  ),
                ],
              ))),
      const SizedBox(
        height: 10.0,
      ),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      const Spacer(),
      Padding(
          padding: ThemeUtils.paddingScaffoldx05,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Get.to(PriceDetailsPage());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nov 22 - 25",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "\$1,178 est.total",
                      style: TextStyle(
                          color: Color(0xFF505050),
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.underline),
                    )
                  ],
                ),
              ),
              const Spacer(),
              NormalButton(
                width: Get.context!.width * 0.41,
                backgroundColor: ThemeUtils.colorPurple,
                text: 'Confirm request',
                onTap: () {},
                cornersRadius: 8,
              ),
            ],
          )),
      const SizedBox(
        height: 10.0,
      ),
    ]);
  }

  Widget containerDates() {
    return Container(
      height: 50,
      width: Get.context!.width,
      padding: ThemeUtils.paddingScaffoldx05,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        SizedBox(
          height: 50,
          width: Get.context!.width * 0.42,
          child: InputDecorator(
            decoration: ThemeUtils.inputDecoration(
                fontWeight: FontWeight.normal,
                isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                labelText: "Starts on"),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  "assets/icons/calendar.svg",
                  height: 20,
                  width: 20.0,
                ),
                Text(
                  "Sat, Oct 08, 10:30 AM",
                  style: TextStyle(fontSize: 09.sp),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          height: 50,
          width: Get.context!.width * 0.42,
          child: InputDecorator(
            decoration: ThemeUtils.inputDecoration(
                fontWeight: FontWeight.normal,
                isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                labelText: "Ends on"),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  "assets/icons/calendar.svg",
                  height: 20,
                  width: 20.0,
                ),
                Text(
                  "Sat, Oct 08, 10:30 AM",
                  style: TextStyle(fontSize: 09.sp),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget pricebreakdown({
    required Widget container(
      String title,
      String subtitle,
    ),
  }) {
    return Column(children: [
      HeaderBarWidgetNoClear(
        title: "Price breakdown",
      ),
      ListView(
        shrinkWrap: true,
        padding: ThemeUtils.paddingScaffoldx05,
        children: [

             container(
              "\$1,000.00 x 4 days",
              "\$4,000.00",
            ),
            SizedBox(
              height: Get.context!.height * 0.0055,
            ),
            const Text(
                "This includes an additional (1) extra day added to your current trip."),
            SizedBox(
              height: Get.context!.height * 0.03,
            ),
            container(
              "Delivery fee",
              "\$100.00",
            ),
            SizedBox(
              height: Get.context!.height * 0.0055,
            ),
            const Text(
                "The delivery is calculated based on factors such as distance, and other relevant considerations determined by the Host."),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            container(
              "Brokr fee",
              "\$100.00",
            ),
            SizedBox(
              height: Get.context!.height * 0.0075,
            ),
            const Text(
                "This help us sustains our platform and also enables us to deliver exceptional support services for your trips. It is calculated as a percentage of the trip price, taking into account factors such as expected costs, vehicle value, trip duration, and more."),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            container(
              "Taxes",
              "\$100.00",
            ),
            SizedBox(
              height: Get.context!.height * 0.0075,
            ),
            const Text(
                "Taxes are accurately calculated based on the rental location's city or region, in compliance with local laws and regulations."),
            SizedBox(
             height: Get.context!.height * 0.015,
            ),
            container(
              "MILES INCLUDED  . . . . . . . . . . . . . . . . . . . . .",
              "400 mi",
            ),
            SizedBox(
              height: Get.context!.height * 0.0075,
            ),
            const Text(
                "The mileage included in your trip is determined by the Host's designated allowance."),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            superContainer("New total (USD)", "\$4,857.80"),
            const Text(
                "This is the new total amount, which includes a 1-day rental extension, as well as taxes and fees."),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            superContainer("Amount paid (USD)", "\$4,857.80"),
            const Text(
                "This amount was previously paid before your trip started"),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            superContainer("Total extension (USD)", "\$4,857.80"),
            const Text(
                "This amount will be charged to your credit card ending in 456 once the Host confirms your request, no charges will me made until then.")
       
        ]
      )
    ]);
  }

  Widget superContainer(
    String title,
    String subTitle,
  ) {
    return Container(
      width: Get.context!.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: const Color.fromARGB(255, 10, 10, 10),
              ),
            ),
          ),
          Expanded(
            child: Text(
              subTitle,
              textAlign: TextAlign.end,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: const Color.fromARGB(255, 10, 10, 10)),
            ),
          )
        ],
      ),
    );
  }

  Widget promocode() {
    return Column(
        /*   physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero, */
        children: [
          HeaderBarWidgetNoClear(
            title: "Add promo code",
          ),
          SizedBox(
            height: Get.context!.height * 0.01,
          ),
          Container(
            padding: ThemeUtils.paddingScaffoldx05,
            height: 60,
            width: Get.context!.width,
            child: InputDecorator(
              decoration: ThemeUtils.inputDecoration(
                  fontWeight: FontWeight.normal,
                  isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  labelText: "Coupon Code"),
              child: const TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          Padding(
            padding: ThemeUtils.paddingScaffoldx05,
            child: Text(
              "If you have a discount coupon you can enter your data to apply it now.",
              style: TextStyle(fontSize: 10.sp),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          BottomBarContainerFullWidget(
              ontap: () {
                Get.back();
              },
              title: "Apply"),
          const SizedBox(
            height: 10,
          ),
        ]);
  }

  Widget travelCredits() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Travel Credits",
          ),
          SizedBox(
            height: Get.context!.height * 0.005,
          ),
          Padding(
            padding: ThemeUtils.paddingScaffoldx05,
            child: Text(
              "\$120.00",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.01,
          ),
          Padding(
            padding: ThemeUtils.paddingScaffoldx05,
            child: Text(
              "Travel credits are your available balance that you can use at any time for rewards and leftover balance from old transactions.",
              style: TextStyle(fontSize: 10.sp),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.035,
          ),
          BottomBarContainerFullWidget(
              ontap: () {
                Get.back();
              },
              title: "Redeem"),
        ]);
  }

  Widget refundableDeposit() {
    return Column(children: [
      HeaderBarWidgetNoClear(
        title: "Refundable deposit",
      ),
      Padding(
        padding: ThemeUtils.paddingScaffoldx05,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "To book your trip with Luis's Lamborghini Huracan, a refundable security deposit is necessary. You can be confident that we will issue a full refund 3 days after of the trip ends, as long as no incidents occur.",
              style: TextStyle(fontSize: 10.sp),
            ),
            SizedBox(
              height: Get.context!.height * 0.03,
            ),
            Text(
              " • Why is a deposit necessary?",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            Text(
              "Deposits provide essential protection for hosts and their vehicles in the unlikely event of an incident, ensuring peace of mind for all parties involved.",
              style: TextStyle(fontSize: 10.sp),
            ),
            SizedBox(
              height: Get.context!.height * 0.03,
            ),
            Text(
              "• When will the deposit be collected?",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            Text(
              "The full deposit will be collected at checkout.",
              style: TextStyle(fontSize: 10.sp),
            ),
            SizedBox(
              height: Get.context!.height * 0.03,
            ),
            Text(
              "• When will the refund be issued?",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            Text(
              "Your refund will be automatically processed on July 23, provided there are no extensions or incidents during your trip.",
              style: TextStyle(fontSize: 10.sp),
            ),
            SizedBox(
              height: Get.context!.height * 0.03,
            ),
            Text(
              "• What happens if the vehicle gets damage?",
              style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.context!.height * 0.015,
            ),
            Text(
              "In the event of any damage during your trip, you have the option to settle the repair costs directly with the Host. Alternatively, the Host is authorized to use the insurance you provided for this trip to cover repairs. Brokr will investigate the claim and utilize the deposit to cover the expenses. If applicable, any remaining amount, after deducting the damage costs, will be refunded to you.",
              style: TextStyle(fontSize: 10.sp),
            ),
          ],
        ),
      )
    ]);
  }

  Widget saveItem({
    required SuperModel item,
  }) {
    TextEditingController nameController = TextEditingController();
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Save this property",
          ),
          Container(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.04,
                right: Get.context!.width * 0.04),
            width: MediaQuery.of(Get.context!).size.width * 0.9,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 2),
                  blurRadius: 25,
                ),
              ],
            ),
            child: ItemCardMini(
              margin: EdgeInsets.only(
                left: ThemeUtils.borderShadowAppBar,
                right: ThemeUtils.borderShadowAppBar,
              ),
              superModel: item,
              changedFavorite: () {},
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: ThemeUtils.paddingScaffoldx05,
            child: InputDecorator(
              decoration: ThemeUtils.inputDecoration(
                  fontWeight: FontWeight.normal,
                  isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  labelText: "Name your favorities list"),
              child: TextField(
                controller: nameController,
                maxLines: 1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                textInputAction: TextInputAction.done,
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: ThemeUtils.paddingScaffoldx05,
            child: Text(
              "Use this board to keep track of listings you love.",
              style: TextStyle(
                  color: const Color(0xFF505050),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.035,
          ),
          BottomBarContainerFullWidget(
              ontap: () {
                Get.back(result: {
                  "name_list": nameController.text.trim(),
                  "item": item
                });
              },
              title: "Save"),
        ]);
  }

  Widget removeItem({
    required SuperModel item,
    required Function remove,
  }) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      HeaderBarWidgetNoClear(
        title: "Remove from your favorites",
      ),
      const Spacer(),
      SvgPicture.asset(
        "assets/icons/delete_cancel.svg",
        height: Get.context!.height * 0.1250,
      ),
      SizedBox(
        height: Get.context!.height * 0.01,
      ),
      Center(
        child: Text(
          "Are you sure?",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.black),
        ),
      ),
      SizedBox(
        height: Get.context!.height * 0.015,
      ),
      Center(
        child: Text(
          "You want to remove this property from your favorites?",
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
              color: Colors.black),
        ),
      ),
      SizedBox(
        height: Get.context!.height * 0.015,
      ),
      const Spacer(),
      FilterBottomBarWidget(
        firstButton: "Cancel",
        title: "Yes, remove",
        callbackReset: () {
          Get.back();
        },
        save: () {
          print("yes remove");
          Get.back();
          remove();
        },
      ),
    ]);
  }

  Widget securityDeposit() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Security deposit",
          ),
          /*    SvgPicture.asset(
            "assets/icons/securepayment.svg",
            height: Get.context!.height * 0.10,
          ),
          SizedBox(
            height: Get.context!.height * 0.03,
          ), */

          Padding(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05),
            child: ListTile(
              minLeadingWidth: 0.0,
              contentPadding: EdgeInsets.zero,
              minVerticalPadding: 0.0,
              leading: SvgPicture.asset(
                "assets/icons/confirm.svg",
                height: 20,
                width: 20,
              ),
              title: Text(
                "Super cars",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05),
            child: Text(
              "A fully refundable security deposit of \$750 will be collected upon booking this car. This deposit is required to ensure the safety of both the renter and the vehicle. It acts as a precautionary measure against any potential damages, violations of rental terms, or unforeseen incidents during the rental period. The amount will be reimbursed within 3 days following the conclusion of your trip, as long as no such incidents occur, providing you with a seamless and worry-free car rental experience.",
              style: TextStyle(
                fontSize: 12.sp,
              ),
              textAlign: TextAlign.justify,
            ),
          )
        ]);
  }

  Widget cancelTrip() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Cancel trip",
          ),
          /*    
          SizedBox(
            height: Get.context!.height * 0.03,
          ), */
          Padding(
            padding: ThemeUtils.paddingScaffoldx05,
            child: Column(
              children: [
                SvgPicture.asset(
                  "assets/icons/delete_cancel.svg",
                  height: Get.context!.height * 0.15,
                ),
                Text(
                  "Are you sure?",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text("We’re still holding your trip."),
                SizedBox(
                  height: Get.context!.height * 0.05,
                ),
                NormalButton(
                  colorBorder: Colors.black,
                  colorText: Colors.black,
                  backgroundColor: Colors.white,
                  text: "Message host",
                  onTap: () {
                    Get.to(MessageConfirmedPage());
                  },
                  cornersRadius: 8,
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                NormalButton(
                  colorBorder: Colors.black,
                  colorText: Colors.black,
                  backgroundColor: Colors.white,
                  text: "Cancel trip",
                  onTap: () {
                    //CODE

                    Get.to(TripCancelledPage());
                  },
                  cornersRadius: 8,
                ),
                SizedBox(
                  height: Get.context!.height * 0.05,
                ),
                NormalButton(
                  backgroundColor: ThemeUtils.colorPurple,
                  text: "Don’t cancel trip",
                  onTap: () {
                    Get.back();
                  },
                  cornersRadius: 8,
                ),
              ],
            ),
          )
        ]);
  }

  Widget mileageinfo() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Mileage info",
          ),
          SvgPicture.asset(
            "assets/icons/mileageinfo.svg",
            height: Get.context!.height * 0.10,
          ),
          SizedBox(
            height: Get.context!.height * 0.03,
          ),
          ListTile(
            minLeadingWidth: 0.0,
            leading: SvgPicture.asset("assets/icons/check.svg"),
            title: Text(
              "Get ready to explore! Your trip covers an exciting 300-mile distance.",
              style: TextStyle(fontSize: 11.sp),
            ),
          ),
          ListTile(
            minLeadingWidth: 0.0,
            leading: SvgPicture.asset("assets/icons/check.svg"),
            title: Text(
              "If you exceed this limit, a charge of \$5 per additional mile will be applied. This ensures you have the flexibility to go further while keeping you informed about any extra costs along the way.",
              style: TextStyle(fontSize: 11.sp),
            ),
          ),
        ]);
  }

  Widget priceDetails() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Price details",
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.context!.height * 0.010,
                ),
                Text(
                  "Trip fees Included",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                ThemeUtils.dividerGrey,
                SizedBox(
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        "assets/icons/confirm.svg",
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "\$1,500.00 x 3 days",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      const Text("\$4,500.00"),
                    ],
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  minLeadingWidth: 0.0,
                  minVerticalPadding: 0.0,
                  title: Text(
                    "Est. trip total (USD)",
                    style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: const Text("\$4,500.00"),
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text(
                  "Not included fees (applied at checkout)",
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: Get.context!.height * 0.025,
                ),
                Text(
                  "Brokr fee",
                  style: TextStyle(
                      fontSize: 12.sp, color: Color.fromARGB(255, 3, 3, 3)),
                ),
                SizedBox(
                  height: Get.context!.height * 0.0125,
                ),
                Text(
                  "This help us sustains our platform and also enables us to deliver exceptional support services for your trips. It is calculated as a percentage of the trip price, taking into account factors such as expected costs, vehicle value, trip duration, and more.",
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                      height: 1.5,
                      wordSpacing: 1.5),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: Get.context!.height * 0.025,
                ),
                Text(
                  "Taxes",
                  style: TextStyle(
                      fontSize: 12.sp, color: Color.fromARGB(255, 3, 3, 3)),
                ),
                SizedBox(
                  height: Get.context!.height * 0.0125,
                ),
                Text(
                  "Taxes are accurately calculated based on the rental location's city or region, in compliance with local laws and regulations.",
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                      height: 1.5,
                      wordSpacing: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ]);
  }

  Widget cancellationPolicy() {
    return ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          HeaderBarWidgetNoClear(
            title: "Cancellation policy",
          ),
          Padding(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.context!.height * 0.010,
                ),
                Text(
                  "Flexible",
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFF505050)),
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text(
                  "100% Payout for cancellations made within 24 hours of the booking start time.",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    wordSpacing: 1.5,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                ThemeUtils.dividerGrey,
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text(
                  "Moderate",
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFF505050)),
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text(
                  "100% Payout for cancellations made within 2 days of the booking start time. 50% Payout for cancellations made between 2-5 days of the booking start time.",
                  style: TextStyle(
                      fontSize: 10.sp,
                      color: Colors.black,
                      height: 1.5,
                      wordSpacing: 1.5),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                ThemeUtils.dividerGrey,
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text(
                  "Strict",
                  style: TextStyle(
                      fontSize: 12.sp, color: const Color(0xFF505050)),
                ),
                SizedBox(
                  height: Get.context!.height * 0.015,
                ),
                Text(
                  "100% Payout for cancellations made within 14 days of the booking start time. 50% Payout for cancellations made between 14-30  days of the booking start time.",
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: Colors.black,
                    wordSpacing: 1.5,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ]);
  }

  Widget whenForCars({
    String? location,
    required Function getBackFunction,
    String pickupDate = "22/11/2023",
    String returnDate = "25/11/2023",
    required GuestHomeController controller,
    required HourModel? hourStart,
    required HourModel? hourEnd,
    List<HourModel>? listStart,
    List<HourModel>? listEnd,
    DateTime? start,
    DateTime? end,
  }) {
    listStart = HourModel.createList();
    listEnd = HourModel.createList();

    return Column(
        /*     physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero, */
        children: [
          HeaderBarWidget(
              title: "Select Dates",
              radius: true,
              functionClear: () {
                listStart = HourModel.createList();
                listEnd = HourModel.createList();
                hourStart = null;
                hourEnd = null;
                location = null;

                start = null;
                end = null;

                controller.updateWidgetGlobal("star_car");
                controller.updateWidgetGlobal("location_cars");
                controller.updateWidgetGlobal("calendar_cars");
              }),
          GetBuilder<GuestHomeController>(
            id: "location_cars",
            builder: (__) => Padding(
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              child: TextFieldLocationWidget(
                hintText: location ?? "",
                pressed: () {
                  print("yes");
                  Get.back();
                  getBackFunction();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          GetBuilder<GuestHomeController>(
            id: "headers-dates",
            builder: (__) => Padding(
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50,
                    width: Get.context!.width * 0.40,
                    child: InputDecorator(
                      decoration: ThemeUtils.inputDecoration(
                          fontWeight: FontWeight.normal,
                          isPadding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          labelText: "Pickup Date"),
                      child: Center(child: Text(pickupDate)),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    height: 50,
                    width: Get.context!.width * 0.40,
                    child: InputDecorator(
                      decoration: ThemeUtils.inputDecoration(
                          fontWeight: FontWeight.normal,
                          isPadding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          labelText: "Return Date"),
                      child: Center(child: Text(returnDate)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: Get.context!.height * 0.010,
          ),
          ThemeUtils.dividerGrey,
          GetBuilder<GuestHomeController>(
            id: "calendar_cars",
            builder: (__) => SizedBox(
              height: Get.context!.height * 0.39,
              child: DatePickerCustom(
                start: start,
                end: end,
                singleSelection: false,
                callback: (String startString, String endString,
                    DateTime starDateTime, DateTime endDateTime) {
                  pickupDate = (startString);
                  returnDate = (endString);
                  start = starDateTime;
                  end = endDateTime;

                  controller.updateWidgetGlobal("headers-dates");
                },
              ),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          ThemeUtils.dividerGrey,
          const SizedBox(
            height: 10.0,
          ),
          GetBuilder<GuestHomeController>(
            id: "star_car",
            builder: (__) => Container(
                padding: EdgeInsets.only(
                  left: Get.context!.width * 0.05,
                  right: Get.context!.width * 0.05,
                ),
                height: 40,
                width: Get.context!.width,
                child: Row(
                  children: [
                    Text("Start",
                        style: TextStyle(
                            fontFamily: ThemeUtils.interRegular,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Expanded(
                      child: HoursListWidget(
                        list: listStart!,
                        onchanged: (HourModel value) {
                          hourStart = value;
                        },
                      ),
                    ),
                  ],
                )),
          ),
          const SizedBox(
            height: 10.0,
          ),
          GetBuilder<GuestHomeController>(
              id: "star_car",
              builder: (__) => Container(
                  padding: EdgeInsets.only(
                    left: Get.context!.width * 0.05,
                    right: Get.context!.width * 0.05,
                  ),
                  height: 40,
                  width: Get.context!.width,
                  child: Row(
                    children: [
                      Text("End",
                          style: TextStyle(
                              fontFamily: ThemeUtils.interRegular,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: HoursListWidget(
                          list: listEnd!,
                          onchanged: (HourModel value) {
                            hourEnd = value;
                          },
                        ),
                      ),
                    ],
                  ))),
          const SizedBox(
            height: 10.0,
          ),
          ThemeUtils.dividerGrey,
          SizedBox(
            height: Get.context!.height * 0.035,
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
            ),
            child: NormalButton(
              backgroundColor: ThemeUtils.colorPurple,
              text: 'Search',
              onTap: () {
                Get.back(result: {
                  "pickupDate": pickupDate,
                  "returnDate": returnDate,
                  "hourStart": hourStart,
                  "hourEnd": hourEnd,
                });
              },
              cornersRadius: 8,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
        ]);
  }

  Widget whenForStays(
    GuestHomeController guestHomeController, {
    String? location,
    required Function getBackFunction,
    String pickupDate = "22/11/2023",
    String returnDate = "25/11/2023",
    DateTime? start,
    DateTime? end,
  }) {
    String who = "";
    return Column(children: [
      HeaderBarWidget(
          title: "Select Dates",
          radius: true,
          functionClear: () {
            location = null;
            start = null;
            end = null;
            who = "";

            guestHomeController.updateWidgetGlobal("calendar_stays");
            guestHomeController.updateWidgetGlobal("location_stays");
            guestHomeController.updateWidgetGlobal("who_stays");
          }),
      GetBuilder<GuestHomeController>(
          id: "location_stays",
          builder: (__) => Padding(
                padding: EdgeInsets.only(
                  left: Get.context!.width * 0.05,
                  right: Get.context!.width * 0.05,
                ),
                child: TextFieldLocationWidget(
                  hintText: location ?? "",
                  pressed: () {
                    Get.back();
                    getBackFunction();
                  },
                ),
              )),
      const SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: Get.context!.width * 0.05,
          right: Get.context!.width * 0.05,
        ),
        child: GetBuilder<GuestHomeController>(
            id: "headers-dates",
            builder: (__) => customRow(pickupDate, returnDate)),
      ),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      GetBuilder<GuestHomeController>(
          id: "calendar_stays",
          builder: (__) => SizedBox(
                height: Get.context!.height * 0.39,
                child: DatePickerCustom(
                  singleSelection: false,
                  callback: (String startlocale, String endlocale,
                      DateTime starDateTime, DateTime endDateTime) {
                    pickupDate = (startlocale);
                    returnDate = (endlocale);
                    start = starDateTime;
                    end = endDateTime;
                    print(pickupDate);
                    print(returnDate);

                    guestHomeController.updateWidgetGlobal("headers-dates");
                  },
                ),
              )),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      const SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: EdgeInsets.only(
          left: Get.context!.width * 0.05,
          right: Get.context!.width * 0.05,
        ),
        child: TextAlignLeft(
          title: "Who’s traveling with you?",
          color: Colors.black,
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      GetBuilder<GuestHomeController>(
        id: "who_stays",
        builder: (__) => Padding(
          padding: EdgeInsets.only(
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05,
          ),
          child: InkWell(
            onTap: () async {
              var response = await GuestBottomSheests.buildBottomSheet(
                  color: const Color(0XFFF2F2F2),
                  context: Get.context!,
                  child: const GuessWidget(),
                  height: Get.context!.height);
              if (response != null) {
                print("response to who $response");
                who = response["response"] as String;
                guestHomeController.updateWidgetGlobal("who_stays");
              }
            },
            child: SizedBox(
              height: 50,
              width: Get.context!.width,
              child: InputDecorator(
                  decoration: ThemeUtils.inputDecoration(
                      fontWeight: FontWeight.normal,
                      isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      labelText: "Who"),
                  child: Row(
                    children: [
                      const Icon(Icons.people_outline),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(who),
                    ],
                  )),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
      ThemeUtils.dividerGrey,
      const Spacer(),
      Padding(
        padding: EdgeInsets.only(
          left: Get.context!.width * 0.05,
          right: Get.context!.width * 0.05,
        ),
        child: NormalButton(
          backgroundColor: ThemeUtils.colorPurple,
          text: 'Search',
          onTap: () {
            Get.back(result: {
              "pickupDate": pickupDate,
              "returnDate": returnDate,
              "location": location,
              "who": who,
            });
          },
          cornersRadius: 8,
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
    ]);
  }

  Widget whenForBoats(
    GuestHomeController guestHomeController, {
    String? location,
    required Function getBackFunction,
    HourModel? hourStart,
    String passengers = "",
    String pickupDate = "22/11/2023",
    String returnDate = "25/11/2023",
    DateTime? start,
    DateTime? end,
    List<HourModel>? departureTime,
    List<ListNumberModel>? listNumber,
    bool? singleSelection = true,
  }) {
    List<bool> isSelected = [true, false];
    departureTime = HourModel.createList();
    listNumber = ListNumberModel.createList();

    return Column(children: [
      HeaderBarWidget(
          title: "Select Dates",
          radius: true,
          functionClear: () {
            location = null;
            passengers = "";
            start = null;
            end = null;
            departureTime = HourModel.createList();
            listNumber = ListNumberModel.createList();
            isSelected = [true, false];
            singleSelection = true;
            guestHomeController.updateWidgetGlobal("passengers_boats");
            guestHomeController.updateWidgetGlobal("number_boats");
            guestHomeController.updateWidgetGlobal("departure_time_boats");
            guestHomeController.updateWidgetGlobal("location_boats");
            guestHomeController.updateWidgetGlobal("estilos-botones");
            guestHomeController.updateWidgetGlobal("headers-dates");
          }),
      GetBuilder<GuestHomeController>(
          id: "location_boats",
          builder: (___) => Padding(
                padding: EdgeInsets.only(
                  left: Get.context!.width * 0.05,
                  right: Get.context!.width * 0.05,
                ),
                child: TextFieldLocationWidget(
                  hintText: location ?? "",
                  pressed: () {
                    Get.back();
                    getBackFunction();
                  },
                ),
              )),
      const SizedBox(
        height: 20.0,
      ),
      GetBuilder<GuestHomeController>(
        id: "estilos-botones",
        builder: (___) => Container(
          margin: EdgeInsets.only(
            left: Get.context!.width * 0.20,
            right: Get.context!.width * 0.20,
          ),
          height: 55,
          width: Get.context!.width * 0.5950,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.025),
            color: const Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(52),
          ),
          alignment: Alignment.center,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    singleSelection = true;
                    isSelected[0] = true;
                    isSelected[1] = false;

                    guestHomeController.updateWidgetGlobal("headers-dates");
                    guestHomeController.updateWidgetGlobal("estilos-botones");
                    guestHomeController
                        .updateWidgetGlobal("departure_time_boats");
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: Get.context!.width * 0.27,
                      decoration: BoxDecoration(
                        color: isSelected[0]
                            ? Colors.white
                            : const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(52),
                        boxShadow: isSelected[0]
                            ? [
                                const BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 1),
                                  blurRadius: 8,
                                ),
                              ]
                            : [],
                      ),
                      child: Text(
                        "Single day",
                        style: TextStyle(
                            color: isSelected[0]
                                ? ThemeUtils.colorPurple
                                : const Color(0xFF676A6F)),
                      )),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {
                    isSelected[1] = true;
                    isSelected[0] = false;
                    singleSelection = false;
                    guestHomeController.updateWidgetGlobal("headers-dates");
                    guestHomeController.updateWidgetGlobal("estilos-botones");
                    guestHomeController
                        .updateWidgetGlobal("departure_time_boats");
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: Get.context!.width * 0.27,
                      decoration: BoxDecoration(
                        color: isSelected[1]
                            ? Colors.white
                            : const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(52),
                        boxShadow: isSelected[1]
                            ? [
                                const BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  offset: Offset(0, 1),
                                  blurRadius: 8,
                                ),
                              ]
                            : [],
                      ),
                      child: Text(
                        "Multi - day",
                        style: TextStyle(
                            color: isSelected[1]
                                ? ThemeUtils.colorPurple
                                : const Color(0xFF676A6F)),
                      )),
                ),
              ]),
        ),
      ),
      const SizedBox(
        height: 20.0,
      ),
      GetBuilder<GuestHomeController>(
        id: "headers-dates",
        builder: (__) => Padding(
          padding: EdgeInsets.only(
            left: Get.context!.width * 0.05,
            right: Get.context!.width * 0.05,
          ),
          child: InputDecorator(
            decoration: ThemeUtils.inputDecoration(
                fontWeight: FontWeight.normal,
                isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                labelText: "When"),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (isSelected[0]) ...{
                  Text(pickupDate),
                } else ...{
                  Text(pickupDate),
                  Container(
                    color: Colors.black,
                    height: 20.0,
                    width: 1.5,
                  ),
                  Text(returnDate),
                }
              ],
            ),
          ),
        ),
      ),
      GetBuilder<GuestHomeController>(
        id: "headers-dates",
        builder: (__) => SizedBox(
          height: Get.context!.height * 0.20,
          child: DatePickerCustom(
            start: start,
            end: end,
            singleSelection: singleSelection!,
            callback: (String startlocale, String endlocale,
                DateTime starDateTime, DateTime endDateTime) {
              pickupDate = (startlocale);
              returnDate = (endlocale);

              start = starDateTime;
              end = endDateTime;
              guestHomeController.updateWidgetGlobal("headers-dates");
            },
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          left: Get.context!.width * 0.05,
          right: Get.context!.width * 0.05,
        ),
        child: TextAlignLeft(
          title: "How Many Passengers?",
          color: Colors.black,
        ),
      ),
      SizedBox(
        height: Get.context!.height * 0.025,
      ),
      GetBuilder<GuestHomeController>(
        id: "passengers_boats",
        builder: (__) => InkWell(
          onTap: () async {
            //passengers

            List<String> values = ["1", "2", "3", "4", "5", "6", "7", "8+"];
            var response = await showCupertinoCustom(listCupertinoDialog(
                values, values[0],
                title: "How Many Passengers?"));
            if (response != null) {
              print(response);
              passengers = response["response"] as String;
              guestHomeController.updateWidgetGlobal("passengers_boats");
            }
          },
          child: Container(
            padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
            ),
            height: 50,
            width: Get.context!.width,
            child: InputDecorator(
                decoration: ThemeUtils.inputDecoration(
                    fontWeight: FontWeight.normal,
                    isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    labelText: "Passengers"),
                child: Row(
                  children: [
                    const Icon(Icons.people_outline),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(passengers)
                  ],
                )),
          ),
        ),
      ),
      SizedBox(
        height: Get.context!.height * 0.025,
      ),
      GetBuilder<GuestHomeController>(
        id: "number_boats",
        builder: (__) => Container(
            //  color: Colors.red,
            padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
            ),
            height: 40,
            width: Get.context!.width,
            child: Row(
              children: [
                Text("How Many Hour",
                    style: TextStyle(
                        fontFamily: ThemeUtils.interRegular,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: NumberListWidget(
                    list: listNumber,
                  ),
                ),
              ],
            )),
      ),
      SizedBox(
        height: Get.context!.height * 0.015,
      ),
      GetBuilder<GuestHomeController>(
        id: "departure_time_boats",
        builder: (__) => Container(
            padding: EdgeInsets.only(
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05,
            ),
            height: isSelected[0] ? 40.0 : 0.0,
            width: Get.context!.width,
            child: Row(
              children: [
                Text("Departure Time",
                    style: TextStyle(
                        fontFamily: ThemeUtils.interRegular,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: HoursListWidget(
                    list: departureTime!,
                    onchanged: (HourModel value) {
                      hourStart = value;
                    },
                  ),
                ),
              ],
            )),
      ),
      const Spacer(),
      Padding(
        padding: EdgeInsets.only(
          left: Get.context!.width * 0.05,
          right: Get.context!.width * 0.05,
        ),
        child: NormalButton(
          backgroundColor: ThemeUtils.colorPurple,
          text: 'Search',
          onTap: () {},
          cornersRadius: 8,
        ),
      ),
      const SizedBox(
        height: 10.0,
      ),
    ]);
  }

  Widget customRow(
    String firstDate,
    String secondDate,
  ) {
    return SizedBox(
      height: 50,
      width: Get.context!.width,
      child: InputDecorator(
        decoration: ThemeUtils.inputDecoration(
            fontWeight: FontWeight.normal,
            isPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
            labelText: "When"),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                firstDate,
                style: const TextStyle(),
              ),
            ),
            Container(
              width: 1.5,
              height: 30.0,
              color: Colors.black.withOpacity(.5),
            ),
            Center(
              child: Text(
                secondDate,
                style: const TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future buildshowGeneralDialog(
      {required BuildContext context,
      required double height,
      required Widget widgetChild}) async {
    return await showGeneralDialog(
      context: context,
      pageBuilder: (_____, anim1, anim2) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Container(
                    margin: MediaQuery.of(context).viewInsets,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: height,
                    child: widgetChild),
              ),
            );
          },
        );
      },
      transitionBuilder: (___, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  static Future<Map?> showCupertinoCustom(Widget child) async {
    return await showCupertinoModalPopup<Map>(
      context: Get.context!,
      builder: (BuildContext context) => Container(
        height: Get.context!.height * 0.25,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: child,
      ),
    );
  }

  static Widget listCupertinoDialog(
    List<String> listElements,
    String selected, {
    required String title,
  }) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text("Cancel")),
            Text(title,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decoration: TextDecoration.none)),
            TextButton(
                onPressed: () {
                  Get.back(result: {
                    "response": selected,
                  });
                },
                child: const Text("Done")),
          ],
        ),
        Expanded(
          child: CupertinoPicker(
            offAxisFraction: 0.0,
            magnification: 1.22,
            squeeze: 1.2,
            useMagnifier: true,
            itemExtent: 32.0,
            scrollController: FixedExtentScrollController(
              initialItem: 0,
            ),
            onSelectedItemChanged: (int selectedItem) {
              selected = listElements[selectedItem];
            },
            children: List<Widget>.generate(listElements.length, (int index) {
              return Center(
                  child: Text(
                listElements[index],
                style: TextStyle(fontSize: 12.sp),
              ));
            }),
          ),
        )
      ],
    );
  }
}
