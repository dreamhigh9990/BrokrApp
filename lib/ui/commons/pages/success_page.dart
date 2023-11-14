import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/theme_utils.dart';

import '../../guest/pages/home/guest_home_page.dart';
import '../../widgets/normal_button.dart';
import '../../widgets/primary_text.dart' as common_text;

class SuccessPage extends StatelessWidget {
  static String name = '/success-page';
  final String svg;
  final String title;
  final String subtitle;
  final String titleButton;

  const SuccessPage(
      {super.key,
      required this.svg,
      required this.title,
      required this.subtitle,
      required this.titleButton});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(title: "Success", showLeading: false),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Spacer(),
            SvgPicture.asset(
              'assets/icons/$svg.svg',
              height: MediaQuery.of(context).size.height * 0.1250,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
             AutoSizeText(
             title,
              textAlign: TextAlign.center,
              style:const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
             AutoSizeText(
             subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            NormalButton(
              backgroundColor: ThemeUtils.colorPurple,
              text: titleButton,
              onTap: () {
                Get.offAllNamed(GuestHomePage.name);
              },
              cornersRadius: 8,
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
