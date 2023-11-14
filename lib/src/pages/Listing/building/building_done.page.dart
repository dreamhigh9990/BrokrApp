import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/widgets/CustomOutlineInputField.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class BuildingDonePage extends StatelessCustom {
  static String name = '/building-done/';
  BuildingDonePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black38,
            size: 19,
          ),
          onPressed: (() => Get.back()),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(6),
        ),
        margin: EdgeInsets.only(top: responsive.hp(5)),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(bottom: responsive.hp(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Your building is elegible",
                            style: fontSize.headline4()),
                        SizedBox(
                          width: responsive.wp(4),
                        ),
                        Image.asset("assets/listing/Vector.png"),
                      ],
                    ),
                    SizedBox(height: responsive.hp(2.5)),
                    Text(
                      "We need more information to set up your listing",
                      style: fontSize.subtitle2().copyWith(
                            fontSize: responsive.ip(1.7),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0,
              ),
              height: 80.0,
              width: responsive.wp(100),
              color: colorsTheme.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    child: Text.rich(
                      TextSpan(
                        text: "Back",
                        style: fontSize.bodyText1().copyWith(
                              decoration: TextDecoration.underline,
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.back();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 130.0,
                    child: GradientButton(
                      text: "Continue",
                      textSize: 2,
                      onPressed: () {
                        Get.back();
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
