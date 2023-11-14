import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/commons/pages/verify_email_page.dart';
import 'package:brokr/ui/commons/pages/verify_phone_page.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/ui/widgets/input_field.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../../controllers/global_controller.dart';
import '../../../utils/theme_utils.dart';
import '../../widgets/lineal_row_text.dart';
import '../../widgets/select_country_widget.dart';
import '../../widgets/social_button.dart';
import '../../widgets/primary_text.dart' as common_text;

class LoginPage extends StatefulWidget {
  static String name = '/login-page';

  const LoginPage({super.key});

  @override
  State createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final phoneMask = MaskTextInputFormatter(mask: '(###) ###-##-##');
  String? _countryName;
  Country? _selectedCountry;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ctr = Get.find<GlobalController>();
  bool _showingEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const common_text.CommonText(text: 'Log in or Sign up'),
        leading: _showingEmail
            ? IconButton(
                onPressed: () {
                  setState(() {
                    _showingEmail = false;
                  });
                },
                icon: const Icon(Icons.arrow_back),
              )
            : null,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 1,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (!_showingEmail)
                SelectCountryWidget(
                  countryName: _countryName,
                  onSelect: (country) {
                    setState(() {
                      _countryName = '${country.name} +${country.phoneCode}';
                      _selectedCountry = country;
                    });
                  },
                ),
              if (_showingEmail)
                InputField(
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  cornersValue: 8,
                ),
              const SizedBox(height: 16),
              if (!_showingEmail)
                InputField(
                  labelText: 'Phone number',
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  cornersValue: 8,
                  formatters: [phoneMask],
                ),
              if (_showingEmail)
                InputField(
                  labelText: 'Password',
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  controller: _passwordController,
                  cornersValue: 8,
                ),
              if (!_showingEmail) const SizedBox(height: 16),
              AutoSizeText(
                'We will send you an SMS with the OTP code to confirm your account.',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withOpacity(0.6),
                    letterSpacing: 0.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.context!.height * 0.1),
              NormalButton(
                text: 'Continue',
                onTap: () {
                  if (_showingEmail) {
                    if (_emailController.text.isEmpty) {
                      _ctr.showError('Error', 'Please enter an email address');
                      return;
                    }
                    if (_passwordController.text.isEmpty) {
                      _ctr.showError('Error', 'Please enter your password');
                      return;
                    }

                    Get.toNamed(
                      VerifyEmailPage.name,
                      arguments: _emailController.text,
                    );
                  } else {
                    if (_selectedCountry == null) {
                      _ctr.showError('Error', 'Please select a country');
                      return;
                    }

                    if (_phoneController.text.isEmpty) {
                      _ctr.showError('Error', 'Please enter a phone number');
                      return;
                    }

                    Get.toNamed(
                      VerifyPhonePage.name,
                      arguments:
                          '+${_selectedCountry!.phoneCode} ${_phoneController.text}',
                    );
                  }
                },
                textSize: 17,
                weight: FontWeight.w500,
                backgroundColor: ThemeUtils.colorPink,
              ),
              SizedBox(height: Get.context!.height * 0.025),
              const LinealRowText(
                title: "Or",
              ),
              SizedBox(height: Get.context!.height * 0.025),
              if (!_showingEmail)
                SocialButton(
                  backgroundColor: Colors.white,
                  text: 'Continue with email',
                  icon: 'assets/icons/sign_with_email.svg',
                  onTap: () {
                    setState(() {
                      _showingEmail = true;
                    });
                  },
                  heightIcon: 15,
                  widthIcon: 15,
                ),
              const SizedBox(height: 16),
              SocialButton(
                colorSVG: Colors.black,
                colorText: Colors.black,
                backgroundColor: Colors.white,
                text: 'Continue with Apple',
                icon: 'assets/icons/apple_icon.svg',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              SocialButton(
                backgroundColor: Colors.white,
                text: 'Continue with Google',
                icon: 'assets/icons/google_icon.svg',
                onTap: () {},
              ),
              const SizedBox(height: 16),
              SocialButton(
                colorText: Colors.black,
                backgroundColor: Colors.white,
                text: 'Continue with Facebook',
                icon: 'assets/icons/facebook_icon.svg',
                onTap: () {},
              ),
              SizedBox(height: Get.context!.height * 0.025),
              const LinealRowText(
                title: "Sign up as Broker",
              ),
              SizedBox(height: Get.context!.height * 0.025),
              const Text("Don’t have an account?"),
               SizedBox(height: Get.context!.height * 0.025),
              NormalButton(
                text: 'Apply Here',
                onTap: () {
                  Get.toNamed("/listing-select");
                },
                backgroundColor: ThemeUtils.colorPurple,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}