// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

class ShareFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;
  TextEditingController textarea = TextEditingController();

  ShareFragment({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Share',
        leading:
            const IconWidget(icon: Icons.person_add_alt, color: Colors.white),
        child: SettingsScreen(
          title: 'Share',
          children: <Widget>[
            const SizedBox(height: 32),
            const Text("""
Share your code with family or friends and you both get USD 20 when they complete their fist booking."""),
            const SizedBox(height: 300),
            const SizedBox(height: 200),
            submitButton(context)
          ],
        ),
      );

  Widget bottomBar(BuildContext context) => Scaffold(
        body: Center(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [copyText(context), submitButton(context)],
                ))),
      );

  Widget copyText(BuildContext context) => GestureDetector(
        child: const Text(
          "Copy your link",
          style: TextStyle(decoration: TextDecoration.underline),
        ),
        onTap: () {
        
        },
      );

  Widget submitButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
     
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:const  Color.fromARGB(255, 175, 26, 205),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
      ),
      child:const Text("Share"),
    );
  }
}
