import 'package:brokr/ui/widgets/icon_button_widget.dart';
import 'package:brokr/ui/widgets/icon_radio_button.dart';
import 'package:brokr/ui/widgets/input_field.dart';
import 'package:brokr/ui/widgets/pin_widget.dart';
import 'package:brokr/ui/widgets/select_country_widget.dart';
import 'package:brokr/ui/widgets/social_button.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/normal_button.dart';

class ExamplePage extends StatefulWidget {
  static const name = "/example-page";
  const ExamplePage({super.key});

  @override
  State createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();
  String? _countryName;
  RangeValues _currentRangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Page"),
      ),
      body: Container(
        padding: const EdgeInsets.all(32),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NormalButton(
                  backgroundColor: ThemeUtils.colorPurple,
                text: 'Gradient Button',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              SocialButton(
                backgroundColor: Colors.white,
                text: 'Continue with email',
                icon: 'assets/images/email.svg',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              PinWidget(pinController: _pinController, focusNode: _focusNode),
              const SizedBox(height: 16),
              const InputField(
                hintText: 'Bussiness name',
                labelText: 'Bussiness name',
              ),
              const SizedBox(height: 16),
              SelectCountryWidget(
                countryName: _countryName,
                onSelect: (country) {
                  setState(() {
                    _countryName = country.name;
                  });
                },
              ),
              const SizedBox(height: 16),
              const TextAreaField(
                maxLength: 300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconRadioButton(
                      iconPath: 'assets/images/email.svg',
                      text: 'Car',
                      value: 1,
                      groupValue: 1,
                      onChanged: (value) {}),
                  const SizedBox(width: 16),
                  IconRadioButton(
                      iconPath: 'assets/images/email.svg',
                      text: 'Car',
                      value: 2,
                      groupValue: 1,
                      onChanged: (value) {}),
                  const SizedBox(width: 16),
                  IconButtonWidget(
                      iconPath: 'assets/images/email.svg',
                      text: 'Pool',
                      onTap: () {}),
                ],
              ),
              const SizedBox(height: 16),
              RangeSlider(
                values: _currentRangeValues,
                max: 100,
                divisions: 100,
                activeColor: ThemeUtils.primaryColor,
                inactiveColor: ThemeUtils.primaryColor.withOpacity(0.2),
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  },);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
