// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

class PromoFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;
  TextEditingController textarea = TextEditingController();

  PromoFragment({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Promotional Code',
        leading: const IconWidget(
            icon: Icons.discount_outlined, color: Colors.white),
        child: SettingsScreen(
          title: 'Promotional Code',
          children: <Widget>[
            const SizedBox(height: 32),
            const Text('''
Let’s redeem your code'''),
            const SizedBox(height: 32),
            buildTextArea(context),
            const SizedBox(height: 32),
            submitButton(context)
          ],
        ),
      );

  Widget bottomBar(BuildContext context) => Scaffold(
        body: Center(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [submitButton(context)],
                ))),
      );

  Widget buildTextArea(BuildContext context) => Center(
      child: SizedBox(
          width: 300,
          child: TextField(
              controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 1,
              decoration: const InputDecoration(
                  hintText: "Code",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0)))))));

  Widget submitButton(BuildContext context) {
    return Center(
        child: SizedBox(
      height: height,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
        
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:const Color.fromARGB(255, 175, 26, 205),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        child: const Text("Redeem Code"),
      ),
    ));
  }
}
