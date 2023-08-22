import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/super_model.dart';
import '../../../../utils/theme_utils.dart';
import '../../../commons/pages/success_page.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/booking_detail/locale/column_headers_widget.dart';
import '../../../widgets/item_card.dart';
import '../../../widgets/normal_button.dart';
import '../../../widgets/text_align_left_widget.dart';
import '../request_to_book/widgets/pay_widget.dart';
import '../request_to_book/widgets/price_details_widget.dart';

class BookingConfirmed extends StatelessWidget {
  final int showFragments;
  final SuperModel superModel;
  const BookingConfirmed({
    super.key,
    required this.superModel,
    required this.showFragments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomBar(title: "Booking Confirmed"),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          margin: ThemeUtils.paddingScaffoldxTop10,
          padding: ThemeUtils.paddingScaffoldx025,
          child: Column(children: [
            ItemCardTrip(
                 titleButton: "Pending Payment",
                  title: "PENDING",
              margin: EdgeInsets.only(
                left: ThemeUtils.borderShadowAppBar,
                right: ThemeUtils.borderShadowAppBar,
              ),
              superModel: superModel,
              changedFavorite: () {},
            ),
            Padding(
              padding: ThemeUtils.paddingScaffoldx025,
              child: Column(
                children: [
                  if (showFragments == 0) ...{
                    ColumnHeadersWidget(
                      title: "Dates",
                      svg: "circle_dates",
                      content: "Sat, Oct 08, 10:30 AM\nSat, Oct 08, 10:30 AM",
                      isShowChange: true,
                    ),
                    ColumnHeadersWidget(
                        isShowChange: true,
                        title: "Pickup & Return",
                        svg: "circle_location",
                        content: "New Jersy, Bloomfield,  72 Avenue 8731"),
                    const PriceDetailsCarWidget(),
                  } else if (showFragments == 1) ...{
                    ColumnHeadersWidget(
                      title: "Dates",
                      svg: "circle_dates",
                      content: "Sat, Oct 08, 10:30 AM\nSat, Oct 08, 10:30 AM",
                      isShowChange: true,
                    ),
                    ColumnHeadersWidget(
                        isShowChange: true,
                        title: "Guest",
                        svg: "circle_guest",
                        content: "7 Adults, 1 Infant, 4 Children, 1 Pet"),
                    const PriceDetailsStayWidget(),
                  } else if (showFragments == 2) ...{
                    ColumnHeadersWidget(
                      title: "Dates",
                      svg: "circle_dates",
                      content: "Sat, Oct 08 | 2 Hours | 12:00 AM",
                      isShowChange: true,
                    ),
                    ColumnHeadersWidget(
                        textCenter: true,
                        isShowChange: true,
                        title: "Passengers",
                        svg: "circle_guest",
                        content: "2"),
                           const PriceDetailsStayWidget(),
                  },
                  ThemeUtils.dividerGrey,
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextAlignLeft(title: "How would you like to pay?"),
                    const SizedBox(
                    height: 10.0,
                  ),
                  const ListTile(
                    minLeadingWidth: 0.0,
                    contentPadding: EdgeInsets.all(0.0),
                    minVerticalPadding: 0.0,
                    title: AutoSizeText(
                      "Pay half now, rest later",
                      style: TextStyle(fontSize: 15.0),
                    ),
                    subtitle: Text(
                      "Pay \$2,400.00 now and rest (\$2,400.00) will be automatically charged to the same payment method on Oct, 05, 2022 No extra fees.",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ThemeUtils.dividerGrey,
                  const SizedBox(
                    height: 20.0,
                  ),
                  const PayWidget(),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: NormalButton(
            text: ("Pay \$3,145.80"),
            onTap: () {
              Get.to(const SuccessPage(
                svg: "congratulations",
                title: "Congratulations!",
                subtitle:
                    "Your trip has been confirmed. Please be sure that you have everything you need prior to departure for a smooth and enjoyable journey.",
                titleButton: "Done",
              ));
            },
            backgroundColor: ThemeUtils.colorPurple),
      ),
    );
  }
}
