
import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../widgets/normal_button.dart';

class DetailBottomBarWidget extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  final Function onPressed;
  DetailBottomBarWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.context!.height * 0.10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ThemeUtils.dividerGrey,
            Padding(
              padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      var response =
                          await GuestBottomSheests.buildshowGeneralDialog(
                              context: context,
                              widgetChild: guestHomeController.bottomSheests
                                  .priceDetails(),
                              height: Get.context!.height * 0.65);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '138\$/',
                            style: TextStyle(
                                color: ThemeUtils.colorPurple,
                                fontWeight: FontWeight.bold),
                            children: const <TextSpan>[
                              TextSpan(
                                  text: 'Day',
                                  style: TextStyle(
                                      color: Color(0xFF646464),
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '\$178 Total',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                fontSize: 12,
                                color: const Color(0xFF646464),
                                decoration: TextDecoration.underline,
                              ),
                        ),
                      ],
                    ),
                  ),
                  NormalButton(
                    width: Get.context!.width * 0.35,
                    backgroundColor: ThemeUtils.colorPurple,
                    weight: FontWeight.normal,
                    text: 'Continue',
                    onTap: () => onPressed(),
                    cornersRadius: 10,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
