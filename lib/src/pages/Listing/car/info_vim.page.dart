import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InfoVIMPage extends StatelessCustom {
  static String name = '/info/vin';
  InfoVIMPage({super.key});

  final vinlocaled = <String>[
    "Driver's side interior dashboard",
    "Driver's side door jamb",
    "Under the hood",
    "Front end of the frame",
    "Vehicle registration",
    "Title documents",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text("What is a VIN number?",
              style: fontSize.bodyText1().copyWith(fontSize: responsive.ip(2.3))),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: IconButton(
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: Colors.black,
              size: 18,
            ),
            onPressed: () => Get.back(),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          ElevatedButton(
            onPressed: () => Get.back(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              "Back",
              style: fontSize.overline().copyWith(fontSize: responsive.ip(2)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(8)),
          padding: EdgeInsets.only(top: responsive.hp(6)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "A VIN, or vehicle identification number, is a unique identifying code given to a vehicle when it's manufactured. The VIN provides a wealth of vital information, including engine type and original product details, and can also be used to determine whether the vehicle was part of a recall or how often the car has been purchased.",
                  style: fontSize.subtitle1().copyWith(
                        fontSize: responsive.ip(1.8),
                      ),
                ),
                SizedBox(height: responsive.hp(9)),
                Text(
                  "Where the VIN is located?",
                  style: fontSize.headline5(),
                ),
                SizedBox(height: responsive.hp(4)),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              gradient: colorsTheme.gradientPrimary,
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              (index + 1).toString(),
                              style: fontSize
                                  .bodyText2(color: Colors.white)
                                  .copyWith(
                                    fontSize: responsive.ip(1.8),
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: responsive.wp(4),
                        ),
                        Text(vinlocaled[index]),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: responsive.hp(3));
                  },
                  itemCount: vinlocaled.length,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
