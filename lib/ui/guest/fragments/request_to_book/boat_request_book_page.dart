import 'package:brokr/ui/commons/pages/success_page.dart';
import 'package:brokr/ui/guest/fragments/request_to_book/widgets/commons_widget.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../models/super_model.dart';
import '../../../widgets/booking_detail/locale/header_image_item_widget.dart';
import '../../../widgets/booking_detail/locale/header_title_item_widget.dart';

class BoatRequestBookPage extends StatelessWidget {
 final SuperModel superModel;
  final String title, owner, address, description;
  final double rating, bath;
  const BoatRequestBookPage(
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Request to book",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
          ),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              }),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
                 Container(
                  
                  height: Get.context!.height*0.25,
                  width: Get.context!.width,
            
            child: HeaderImageItemWidget(imageUrl: superModel.image!)),
          Container(
            margin: ThemeUtils.paddingScaffoldxTop10,
            padding: ThemeUtils.paddingScaffoldx05,
            child: Column(
              children: [
                HeaderTitleItemWidget(
                    title: title,
                    owner: owner,
                    address: address,
                    description: description,
                    rating: rating,
                    bath: bath),
               /*  Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: const [
                            Text("Fri, Oct 07, 2022",
                                style: TextStyle(fontSize: 14.0)),
                            Text("Fri, Oct 07, 2022",
                                style: TextStyle(fontSize: 14.0)),
                          ],
                        ),
                        SvgPicture.asset("assets/icons/calendar.svg"),
                        const SizedBox(
                          width: 5.0,
                        ),
                      ],
                    )),
                    Container(
                      height: 50.0,
                      width: 1.0,
                      color: ThemeUtils.colorGrey,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text("12 Guets",
                            style: TextStyle(fontSize: 14.0)),
                        SvgPicture.asset("assets/icons/people.svg"),
                      ],
                    ))
                  ],
                ), */
                 const SizedBox(height: 10,),
                const Divider(
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Price Details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      "\$4,500.00 x 3 nights",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Spacer(),
                    Text("\$100.00", style: TextStyle(fontSize: 12.0))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Cleaning fee",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Spacer(),
                    Text("\$140.00", style: TextStyle(fontSize: 12.0))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Brokr fee",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Spacer(),
                    Text("\$205.00", style: TextStyle(fontSize: 12.0))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Occupancy taxes and fees",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    Spacer(),
                    Text("FREE", style: TextStyle(fontSize: 12.0))
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: const [
                    Text(
                      "Total (USD)",
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text("\$3,142.80",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Container(
                  padding: ThemeUtils.paddingScaffoldx05,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey, width: 1.0)),
                  child: Column(
                    children: const [
                      ListTile(
                        minLeadingWidth: 0.0,
                        contentPadding: EdgeInsets.all(0.0),
                        minVerticalPadding: 0.0,
                        trailing: Text("\$2,000.00"),
                        title: Text(
                          "Refundable deposit",
                          style: TextStyle(fontSize: 14.0,),
                        ),
                        subtitle: Text(
                          "Refunded 48 hours after this trip ends",
                          style: TextStyle(fontSize: 14.0),
                        ),
                      ),
                    ],
                  ),
                ),
                 CommonsWidget(),
                NormalButton(
                    text: "Send Request",
                    onTap: () {
                     // Get.to(SuccessPage());
                    },
                    backgroundColor: ThemeUtils.colorPurple),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          )
        ])));
  }
}
