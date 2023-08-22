// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

class FeedbackFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;
  TextEditingController textarea = TextEditingController();

  FeedbackFragment({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Feedback',
        leading:
            const IconWidget(icon: Icons.create_outlined, color: Colors.white),
        child: SettingsScreen(
          title: 'Feedback',
          children: <Widget>[
            const SizedBox(height: 32),
          const  Text("Send us your feedback!"),
            const SizedBox(height: 32),
            buildTextArea(context),
            const SizedBox(height: 32),
            submitButton(context)
          ],
        ),
      );

  Widget buildTextArea(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: TextField(
          controller: textarea,
          keyboardType: TextInputType.multiline,
          maxLines: 5,
          decoration: const InputDecoration(
              hintText: "Enter Feedback",
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: Color.fromARGB(255, 0, 0, 0))))));

  Widget submitButton(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          backgroundColor:const Color.fromARGB(255, 175, 26, 205),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        child:const Text("Submit"),
      ),
    );
  }
}
