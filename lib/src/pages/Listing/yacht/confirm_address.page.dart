import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/confirm_address.section.dart';
import 'package:brokr/src/pages/Listing/yacht/section/init_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ConfirmAddressPage extends StateFullCustom {
  static String name = '/listing/yacht/confirm-address';
  ConfirmAddressPage({super.key});

  @override
  State<ConfirmAddressPage> createState() => _ConfirmAddressPageState();
}

class _ConfirmAddressPageState extends State<ConfirmAddressPage> {
  static const List<String> yearList = <String>['2022', '2021', '2020', '2019'];
  bool showExactLocation = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Confirm address",
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
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.black38),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _buildTextField("Street", (p0) => null),
                    const Divider(height: 1, thickness: 1, color: Colors.black38),
                    _buildTextField("City", (p0) => null),
                    const Divider(height: 1, thickness: 1, color: Colors.black38),
                    Row(
                      children: [
                        Expanded(
                          child: _buildTextField("State", (p0) => null),
                        ),
                        _buildLine(),
                        Expanded(
                          child: _buildTextField("Zip code", (p0) => null),
                        ),
                      ],
                    ),
                    const Divider(height: 1, thickness: 1, color: Colors.black38),
                    DropdownButtonWithoutBorderCustom(
                      items: const ["Florida", "Miami"],
                      onChanged: (value) {},
                      label: "Country/Region",
                    ),
                    const Divider(height: 1, thickness: 1, color: Colors.black38),
                    _buildTextField("Marina name", (p0) => null),
                    const Divider(height: 1, thickness: 1, color: Colors.black38),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: _buildTextField("Slip number", (p0) => null),
                        ),
                        _buildLine2(),
                        Expanded(
                          child: _buildTextField("Dock/Pier", (p0) => null),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Image.asset("assets/listing/location.png"),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Show your boat exact location",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
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
                            value: showExactLocation,
                            onChanged: (value) => setState(
                                  () => showExactLocation = !showExactLocation,
                            ),
                            activeColor: const Color(0xff8B2FE0),
                            activeTrackColor: Colors.white,
                            splashRadius: 0,
                            inactiveTrackColor: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 30),
                child: const Text(
                  "Select this option exclusively if you want to make the exact location of your boat publicly available",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextField(String label, Function(String) onChanged) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        label: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
        ),
        alignLabelWithHint: true,
      ),
      onChanged: (value) => onChanged(value),
    );
  }

  Container _buildLine2() {
    return Container(
      width: 1,
      height: 55.0,
      decoration: const BoxDecoration(color: Colors.black38),
    );
  }

  Container _buildLine() {
    return Container(
      width: 1,
      height: 46.0,
      decoration: const BoxDecoration(color: Colors.black38),
    );
  }
}
