import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/routes/navigation__route.dart';
import 'package:brokr/src/widgets/CustomOutlineInputField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AddressInPage extends StateFullCustom {
  static String name = '/listing/car/address';
  AddressInPage({super.key});

  @override
  State<AddressInPage> createState() => _AddressInPageState();
}

class _AddressInPageState extends State<AddressInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Enter your address",
          style: widget.fontSize.bodyText1(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const FaIcon(
            FontAwesomeIcons.chevronLeft,
            color: Colors.black,
            size: 14,
          ),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: widget.responsive.wp(6),
            vertical: widget.responsive.hp(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomOutlineInputField(
                label: "Search",
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              GestureDetector(
                child: Row(
                  children: [
                    const FaIcon(FontAwesomeIcons.locationArrow),
                    const SizedBox(width: 10.0),
                    Text(
                      "Use my current location",
                      style: widget.fontSize.subtitle1(),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              const Divider(color: Colors.black87),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () =>
                    Get.offNamed(NavigationRoute.LISTINGCARCONFIRMADDRESS),
                child: Text(
                  "Enter address manually",
                  style: widget.fontSize.bodyText1().copyWith(
                        decorationStyle: TextDecorationStyle.solid,
                        decoration: TextDecoration.underline,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
