import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/guest/fragments/request_to_book/widgets/commons_widget.dart';
import 'package:brokr/ui/guest/fragments/request_to_book/widgets/price_details_widget.dart';
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/ui/widgets/appbar_widget.dart';
import 'package:brokr/ui/widgets/bottom_bar_container_full_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../models/super_model.dart';
import '../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../bottom_sheets/hours_list_widget.dart';
import '../../../widgets/booking_detail/locale/column_headers_widget.dart';
import '../../../widgets/booking_detail/locale/header_image_item_widget.dart';
import '../../../widgets/booking_detail/locale/header_title_item_widget.dart';

class CarRequestBookPage extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  final SuperModel superModel;
  final String title, owner, address, description;
  final double rating, bath;
    String pickupDate = "Sat, 08 Oct";
  String returnDate = "Sat, 08 Oct";
  HourModel firstHour = HourModel(title: "10:00 AM", value: false);
  HourModel secondHour = HourModel(title: "10:00 AM", value: false);
  
  CarRequestBookPage(
      {super.key,
      required this.superModel,
      required this.title,
      required this.owner,
      required this.address,
      required this.description,
      required this.rating,
      required this.bath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(title: "Request to book"),
      body: SizedBox(
        height: Get.context!.height,
        width: Get.context!.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: Get.context!.height * 0.25,
                  width: Get.context!.width,
                  child: HeaderImageItemWidget(imageUrl: superModel.image!)),
              Container(
                margin: ThemeUtils.paddingScaffoldxTop10,
                padding: ThemeUtils.paddingScaffoldx05,
                child: Column(children: [
                  HeaderTitleItemWidget(
                    title: title,
                    owner: owner,
                    address: address,
                    description: description,
                    rating: rating,
                    bath: bath,
                    showdDivider: false,
                  ),
                  DatesColumnHeadersWidget(
                    title: "Dates",
                    svg: "circle_dates",
                    firstHour: firstHour,
                    secondHour: secondHour,
                    pickupDate: pickupDate,
                    returnDate: returnDate,
                    callback: () async {},
                  ),
                  ColumnHeadersWidget(
                    isShowChange: false,
                    title: "Pickup & Return",
                    svg: "circle_location",
                    content: "New Jersy, Bloomfield,  72 Avenue 8731",
                    callback: () async {},
                  ),
                  const PriceDetailsCarWidget(),
                  InkWell(
                    onTap: () async {
                      var response =
                          await GuestBottomSheests.buildshowGeneralDialog(
                              context: context,
                              widgetChild: guestHomeController.bottomSheests
                                  .refundableDeposit(),
                              height: Get.context!.height * 0.6850);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      decoration: BoxDecoration(
                          color: ThemeUtils.colorPurple.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                              color: ThemeUtils.colorPurple, width: 1.0)),
                      child: Column(
                        children: [
                          ListTile(
                            leading: null,
                            minLeadingWidth: 0.0,
                            contentPadding: const EdgeInsets.all(0.0),
                            minVerticalPadding: 0.0,
                            trailing: const AutoSizeText("\$2000.00"),
                            title: const AutoSizeText(
                              "Refundable deposit",
                              style: TextStyle(fontSize: 15.0),
                            ),
                            subtitle: Text(
                              "This booking requires a security deposit, refunded by Nov 07.",
                              style: TextStyle(fontSize: 7.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CommonsWidget(showPayWith: true),
                ]),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          BottomBarContainerFullWidget(ontap: () {}, title: "Send request"),
    );
  }
}
