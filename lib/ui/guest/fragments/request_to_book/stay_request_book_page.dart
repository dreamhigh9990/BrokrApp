import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/commons/pages/success_page.dart';
import 'package:brokr/ui/guest/fragments/request_to_book/widgets/commons_widget.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/utils/theme_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../models/super_model.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/booking_detail/locale/header_image_item_widget.dart';
import '../../../widgets/booking_detail/locale/header_title_item_widget.dart';
import '../../../widgets/text_align_left_widget.dart';
import 'widgets/price_details_widget.dart';

class StayRequestBookPage extends StatelessWidget {
  final SuperModel superModel;
  final String title, owner, address, description;
  final double rating, bath;
  const StayRequestBookPage(
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderImageItemWidget(imageUrl: superModel.image!),
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
                    showPrice: false,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextAlignLeft(
                    title: "Dates",
                    fontsize: 16,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sat, Oct 08, 10:30 AM",
                        style: TextStyle(
                            fontFamily: ThemeUtils.interRegular,
                            color: ThemeUtils.titleFilter),
                      ),
                      Container(
                        color: Colors.grey,
                        height: 20.0,
                        width: 2.0,
                      ),
                      Text(
                        "Sat, Oct 08, 10:30 AM",
                        style: TextStyle(
                            fontFamily: ThemeUtils.interRegular,
                            color: ThemeUtils.titleFilter),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ThemeUtils.dividerGrey,
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextAlignLeft(
                    title: "Pickup & Return",
                    fontsize: 16,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "New Jersy, Bloomfield,  72 Avenue 8731",
                    style: TextStyle(
                        fontFamily: ThemeUtils.interRegular,
                        color: ThemeUtils.titleFilter),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ThemeUtils.dividerGrey,
                const PriceDetailsStayWidget(),
                  Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey, width: 1.0)),
                    child: Column(
                      children: const [
                   
                        ListTile(
                          leading: null,
                          minLeadingWidth: 0.0,
                          contentPadding: EdgeInsets.all(0.0),
                          minVerticalPadding: 0.0,
                          trailing: AutoSizeText("\$2000.00"),
                          title: AutoSizeText(
                            "Refundable deposit",
                            style: TextStyle(fontSize: 15.0),
                          ),
                          subtitle: AutoSizeText(
                            "Refunded 48 hours after this trip ends",
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                           SizedBox(
                    height: 15.0,
                  ),
                      ],
                    ),
                  ),
                  CommonsWidget(showPayWith: false),
                  NormalButton(
                      text: "Send Request",
                      onTap: () {
                        Get.to(const SuccessPage(
                          svg: "confirm",
                          title: "Your request it’s being processed",
                          subtitle:
                              "Please check periodically to see if your request has been accepted or rejected by the Host.",
                          titleButton: "Done",
                        ));
                      },
                      backgroundColor: ThemeUtils.colorPurple),
                  const SizedBox(
                    height: 10.0,
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
