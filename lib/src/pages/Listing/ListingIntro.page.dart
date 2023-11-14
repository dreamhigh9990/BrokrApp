import 'package:brokr/src/routes/navigation__route.dart';
import 'package:get/get.dart';

import '../../components/custom_widget_page/stateless_custom.dart';

enum ListingType { car, yatch, building }

class ListingIntroPage extends StatelessCustom {
  final ListingType type;
  ListingIntroPage({Key? key, required this.type}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: responsive.hp(60),
            child: Image.asset(
              "assets/listing/${_buildPhoto()}.png",
              fit: BoxFit.cover,
              alignment: const Alignment(1, 0),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: responsive.hp(4),
                horizontal: responsive.wp(4),
              ),
              decoration: BoxDecoration(
                color: colorsTheme.surfaceVariant,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15.0),
                ),
              ),
              height: responsive.hp(43),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPhoto() == "building"
                      ? Text(
                          "Listing your place in few simple steps",
                          style: fontSize.headline4(color: Colors.white),
                        )
                      : ( _buildPhoto() == "yacht" ? Text(
                          "Listing your boat is fast, easy and it’s free!",
                          style: fontSize.headline4(color: Colors.white),
                        ) : Text(
                          "Listing your ${_buildPhoto()} is fast, easy and it’s free!",
                          style: fontSize.headline4(color: Colors.white),
                        )),
                  GradientButton(
                    text: "Let’s get started",
                    onPressed: () => Get.toNamed(_buildRoute()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _buildRoute() {
    switch (type) {
      case ListingType.yatch:
        return NavigationRoute.LISTINGYACHT;
      case ListingType.car:
        return NavigationRoute.LISTINGCAR;
      case ListingType.building:
        return NavigationRoute.LISTINGBUILDING;
      default:
        return "";
    }
  }

  String _buildPhoto() {
    switch (type) {
      case ListingType.yatch:
        return "yacht";
      case ListingType.car:
        return "car";
      default:
        return "building";
    }
  }
}

class GradientButton extends StatelessCustom {
  final String text;
  final VoidCallback? onPressed;
  static const BorderRadius radius = BorderRadius.all(Radius.circular(10.0));
  final double? textSize;

  GradientButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textSize = 2.3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.0,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorsTheme.primary,
            colorsTheme.secondary,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          // stops: const [0.2, 1],
          // transform: const GradientRotation(05),
        ),
        borderRadius: radius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: radius,
            ),
            elevation: 0,
            disabledBackgroundColor: Colors.grey),
        child: Text(
          text,
          style: fontSize
              .headline5(
                color: colorsTheme.surface,
              )
              .copyWith(
                fontSize: responsive.ip(textSize!),
                fontWeight: FontWeight.w100
              ),
        ),
      ),
    );
  }
}
