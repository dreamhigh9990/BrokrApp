import 'package:brokr/ui/commons/pages/complete_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/normal_button.dart';
import 'confirmed_page.dart';
import '../../widgets/pin_widget.dart';

class VerifyPhonePage extends StatefulWidget {
  static String name = '/verify-phone-page';

  const VerifyPhonePage({super.key});

  @override
  State createState() => _VerifyPhonePage();
}

class _VerifyPhonePage extends State<VerifyPhonePage> {
  var _phoneNumber = '';
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _focusNode.requestFocus();
    _phoneNumber = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(
        title: 'Confirm your number',
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Enter the code we sent over SMS to:\n',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: _phoneNumber,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            PinWidget(
              pinController: _pinController,
              focusNode: _focusNode,
              onCompleted: (value) {
               Get.to(CompleteProfile());
              },
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {},
              child: RichText(
                text: const TextSpan(
                  text: 'Didn\'t receive any code? ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Resend code',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            NormalButton(
              text: 'Verify',
              onTap: () {},
              backgroundColor: ThemeUtils.colorPurple,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
