import 'package:brokr/catalog/color_car.dart';
import 'package:brokr/catalog/make_car.dart';
import 'package:brokr/src/blocs/listing_car.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/pages/Listing/yacht/section/init_section.dart';
import 'package:brokr/src/routes/navigation__route.dart';
import 'package:brokr/src/widgets/CustomOutlineInputField.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class VinSection extends StateFullCustom {
  final ListingCarBloc bloc;
  VinSection({super.key, required this.bloc});

  @override
  State<VinSection> createState() => _VinSectionState();
}

class _VinSectionState extends State<VinSection> {
  var value = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: widget.responsive.hp(7)),
      margin: EdgeInsets.symmetric(horizontal: widget.responsive.wp(5)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomOutlineInputField(
                    label: "Enter your VIN",
                  ),
                ),
                SizedBox(width: widget.responsive.wp(4)),
                GestureDetector(
                  onTap: () => Get.toNamed(NavigationRoute.INFOVIN),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            widget.colorsTheme.primary,
                            widget.colorsTheme.secondary
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(17),
                    ),
                    width: 33,
                    height: 33,
                    child: const Center(
                      child: FaIcon(
                        FontAwesomeIcons.question,
                        color: Colors.white,
                        size: 19,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: widget.responsive.hp(3)),
            GradientButton(
              text: "Scan your VIN",
              onPressed: () =>
                  Get.toNamed(NavigationRoute.SCANVIN)?.then((value) {
                print("response ===>>>> $value");
              }),
              textSize: 1.8,
            ),
            SizedBox(height: widget.responsive.hp(3)),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  DropdownButtonWithoutBorderCustom(
                    items: makeCar,
                    onChanged: widget.bloc.addMake,
                    label: "Make",
                  ),
                  const Divider(color: Colors.black38, thickness: 1, height: 1),
                  DropdownButtonWithoutBorderCustom(
                    items: const ["Make 1"],
                    onChanged: widget.bloc.addModel,
                    label: "Model",
                  ),
                  const Divider(color: Colors.black38, thickness: 1, height: 1),
                  DropdownButtonWithoutBorderCustom(
                    items: List.generate(
                        123, (index) => (1900 + index).toString()),
                    onChanged: widget.bloc.addYear,
                    label: "Year",
                  ),
                  const Divider(color: Colors.black38, thickness: 1, height: 1),
                  DropdownButtonWithoutBorderCustom(
                      items: carColors, onChanged: (value) {}, label: "Color"),
                  const Divider(color: Colors.black38, thickness: 1, height: 1),
                  DropdownButtonWithoutBorderCustom(
                      items: const ["Option 1","Option 2"],
                      onChanged: (value) {},
                      label: "Mileage"),
                  const Divider(color: Colors.black38, thickness: 1, height: 1),
                  DropdownButtonWithoutBorderCustom(
                      items: const ["Option 1","Option 2"],
                      onChanged: (value) {},
                      label: "Transmision"),
                  const Divider(color: Colors.black38, thickness: 1, height: 1),
                ],
              ),
            ),
            SizedBox(height: widget.responsive.hp(3)),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    "My car has never had a branded or salvage title",
                    style: widget.fontSize.subtitle1(),
                  ),
                ),
                StatefulBuilder(
                  builder: (context, setState) {
                    return Checkbox(
                      value: value,
                      onChanged: (status) => setState(() => value = !value),
                      splashRadius: 1,
                      activeColor: widget.colorsTheme.primary,
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
