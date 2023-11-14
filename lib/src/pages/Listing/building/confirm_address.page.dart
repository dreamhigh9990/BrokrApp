import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/init_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ConfirmAddressPage extends StateFullCustom {
  static String name = '/listing/building/confirm-address';
  ConfirmAddressPage({super.key});

  @override
  State<ConfirmAddressPage> createState() => _ConfirmAddressPageState();
}

class _ConfirmAddressPageState extends State<ConfirmAddressPage> {
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
                    _buildTextField("Apt, suite, etc. (Optional)", (p0) => null),
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
                      "Show your exact location",
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
                  "The exact location of your place will not be shown to guests or brokers until you have confirmed their booking.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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

