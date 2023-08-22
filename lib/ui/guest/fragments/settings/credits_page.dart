import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CreditsPage extends StatelessWidget {
  static String name = '/credits-page';

  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Credits'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Lottie.asset(
              'assets/lottie/point.json',
              width: 200,
              height: 200,
              animate: true,
            ),
            const SizedBox(height: 32),
            const Text(
              '300',
              style: TextStyle(
                fontFamily: 'Overpass',
                fontSize: 60,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'You can redeem points when making a payment',
            ),
          ],
        ),
      ),
    );
  }
}
