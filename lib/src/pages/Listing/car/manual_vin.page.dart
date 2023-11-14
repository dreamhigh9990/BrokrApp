import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/routes/navigation__route.dart';
import 'package:brokr/src/widgets/CustomOutlineInputField.dart';
import 'package:flutter/gestures.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ManualVinPage extends StatelessCustom {
  static String name = '/manual-vin';
  ManualVinPage({super.key});

  bool isModelLater = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Type your VIN", style: fontSize.bodyText1()),
        centerTitle: true,
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
          horizontal: responsive.wp(5),
        ),
        margin: EdgeInsets.only(top: responsive.hp(5)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomOutlineInputField(label: "Enter your VIN"),
                    SizedBox(height: responsive.hp(5)),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "My model year is 1981 or later",
                            style: fontSize.subtitle2().copyWith(
                                  fontSize: responsive.ip(1.8),
                                ),
                          ),
                        ),
                        StatefulBuilder(
                          builder: (_, setState) {
                            return Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: Switch(
                                  value: isModelLater,
                                  onChanged: (value) => setState(
                                    () => isModelLater = !isModelLater,
                                  ),
                                  activeColor: colorsTheme.primary,
                                  activeTrackColor: Colors.white,
                                  splashRadius: 0,
                                  inactiveTrackColor: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    )
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
                      onPressed: () => Get.toNamed(NavigationRoute.CARDONE),
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
