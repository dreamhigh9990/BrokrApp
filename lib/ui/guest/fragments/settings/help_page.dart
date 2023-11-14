import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

class HelpFragment extends StatelessWidget {
  final double height = 50;
  static const double borderRadius = 4.0;

  const HelpFragment({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Help Fragment',
        leading:
            const IconWidget(icon: Icons.help_outline, color: Colors.white),
        child: SettingsScreen(
          title: 'Help Fragment',
          children: const <Widget>[
             SizedBox(height: 32),
            Text("Lorem Ipsum"),
             SizedBox(height: 32),
             SizedBox(height: 32),
          ],
        ),
      );
}
