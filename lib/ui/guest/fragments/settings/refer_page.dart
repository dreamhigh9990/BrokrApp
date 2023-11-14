import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../utils/theme_utils.dart';

class ReferalPage extends StatelessWidget {
  static String name = '/referal-page';

  const ReferalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Referral'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Spacer(flex: 2),
          Lottie.asset(
            'assets/lottie/gift.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
            animate: true,
          ),
          const Spacer(),
          const Text(
            'Share your code with family or friends and you both get \$20 when they complete their fist booking. ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Overpass',
              fontSize: 18,
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4.0),
                topRight: Radius.circular(4.0),
              ),
              color: Colors.blueGrey.shade300,
            ),
            child: const Text(
              'AAAAA',
              style: TextStyle(fontSize: 24),
            ),
          ),
          const Spacer(flex: 3),
          NormalButton(
              backgroundColor: ThemeUtils.colorPurple,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            text: 'Share Now',
            onTap: () {
              Share.share('Use the code AAAAA to get a discount on BrokerApp');
            },
            cornersRadius: 8,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
