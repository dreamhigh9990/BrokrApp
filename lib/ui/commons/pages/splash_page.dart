import 'dart:async';

import 'package:animated/animated.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../guest/pages/home/guest_home_page.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  static String name = '/splash-page';

  const SplashPage({super.key});

  @override
  State createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  bool _showOptions = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(GuestHomePage.name);
    });
  }

  Widget _buildSplash() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Animated(
        value: _showOptions ? 0 : 1,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        builder: (context, child, animation) => Transform.scale(
          scale: animation.value,
          child: child,
        ),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
            
              const Spacer(),
           
              Lottie.asset(
                'assets/lottie/splash_logo.json',
                height: 80,
                fit: BoxFit.contain,
                animate: true,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptions() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: Animated(
        value: _showOptions ? 1 : 0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        builder: (context, child, animation) => Transform.scale(
          scale: animation.value,
          child: child,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          height: MediaQuery.of(context).size.height * 0.55,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/logo/brokr_logo.png',
                height: 80,
              ),
              const Expanded(child: SizedBox()),
              const Text(
                'The World’s largest rental marketplace designed to provide renters and brokers a wide variety of assets listed by hosts in their local area and everywhere in the world.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const Expanded(child: SizedBox()),
              const Text(
                'Don’t have an account?',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 10),
              NormalButton(
                backgroundColor: ThemeUtils.colorPurple,
                text: 'Get started',
                onTap: () {
                  Get.offAllNamed(LoginPage.name);
                },
                cornersRadius: 8,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildSplash(),
          _buildOptions(),
        ],
      ),
    );
  }
}
