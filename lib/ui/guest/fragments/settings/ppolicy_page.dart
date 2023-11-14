
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter/material.dart';
import '../../../widgets/icon_widget.dart';

// ignore: must_be_immutable
class PpolicyFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;
  TextEditingController textarea = TextEditingController();

  PpolicyFragment({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Privacy Policy',
        leading: const IconWidget(
            icon: Icons.menu_book_outlined, color: Colors.white),
        child: SettingsScreen(
          title: 'Privacy Policy',
          children: const <Widget>[
             SizedBox(height: 32),
            Text("Lorem Ipsum"),
             SizedBox(height: 32),
             SizedBox(height: 32),
          ],
        ),
      );
}
