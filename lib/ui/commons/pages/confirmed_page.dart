import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/theme_utils.dart';

import '../../guest/pages/home/guest_home_page.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/normal_button.dart';

class CongratulationsPage extends StatelessWidget {
  static String name = '/congratulations-page';

  const CongratulationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: const CustomBar(
          showLeading: false,
          title: 'Confirmed',
        ),
        body: Container(
          padding: ThemeUtils.paddingScaffoldx05,
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                'assets/icons/congratulations.svg',
                height: MediaQuery.of(context).size.height * 0.15,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 10),
              Text(
                'Congratulations',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Thank you for verifying your access, you can now enter the platform.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              NormalButton(
                backgroundColor: ThemeUtils.colorPurple,
                text: 'Continue',
                onTap: () {
                  Get.offAllNamed(GuestHomePage.name);
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
}
