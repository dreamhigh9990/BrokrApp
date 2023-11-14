import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessCustom {
  static String name = '/listing-select';
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive.wp(10)),
            child: Column(
              children: [
                SizedBox(height: responsive.hp(3)),
                Text("Listing type", style: fontSize.headline3()),
                SizedBox(height: responsive.hp(6)),
                _buildNavigation("Car", ListingType.car),
                _buildNavigation("Boat", ListingType.yatch),
                _buildNavigation("Place", ListingType.building),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildNavigation(String label, ListingType listing) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ListingIntroPage(type: listing));
      },
      child: Card(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Text(
            label,
            style: fontSize.headline4(),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
