import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'confirmed_page.dart';
import '../../widgets/pin_widget.dart';

class VerifyEmailPage extends StatefulWidget {
  static String name = '/verify-email-page';

  const VerifyEmailPage({super.key});

  @override
  State createState() => _VerifyPhonePage();
}

class _VerifyPhonePage extends State<VerifyEmailPage> {
  var _phoneNumber = '';
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    _phoneNumber = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Confirm your email',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RichText(
                  text: TextSpan(
                    text: 'Enter the code we sent over SMS to:\n',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: _phoneNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: PinWidget(
                pinController: _pinController,
                focusNode: _focusNode,
                onCompleted: (value) {
                  Get.offAllNamed(
                    CongratulationsPage.name,
                    arguments: 'email',
                  );
                },
              ),
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
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
