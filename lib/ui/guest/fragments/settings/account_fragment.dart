
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:flutter/material.dart';
import '../../../widgets/icon_widget.dart';

class AccountFragment extends StatelessWidget {
  static const keyLanguage = 'key-language';
  static const keyLocation = 'key-location';
  static const keyPassword = 'key-password';

  const AccountFragment({super.key});

  @override
  Widget build(BuildContext context) => SimpleSettingsTile(
        title: 'Account Settings',
        subtitle: 'Privacy, Security, Language',
        leading:const  IconWidget(icon: Icons.person, color: Colors.white),
        child: SettingsScreen(
          title: 'Account Settings',
          children: <Widget>[
            buildLanguage(),
            buildLocation(),
            //buildPassword(),
            buildPrivacy(context),
            buildSecurity(context),
            buildAccountInfo(context),
          ],
        ),
      );

  Widget buildLanguage() => DropDownSettingsTile(
        settingKey: keyLanguage,
        title: 'Language',
        selected: 1,
        values: const <int, String> {
          1: 'English',
          2: 'Spanish',
          3: 'Chinese',
          4: 'Hindi',
        },
        onChange: (language) {/* NOOP */},
      );

  Widget buildLocation() => TextInputSettingsTile(
        settingKey: keyLocation,
        title: 'Location',
        initialValue: 'Australia',
        onChange: (location) {/* NOOP */},
      );

  Widget buildPassword() => TextInputSettingsTile(
        settingKey: keyPassword,
        title: 'Password',
        obscureText: true,
        validator: (password) => password != null && password.length >= 6
            ? null
            : 'Enter 6 characters',
      );

  Widget buildPrivacy(BuildContext context) => SimpleSettingsTile(
        title: 'Privacy',
        subtitle: '',
        leading: const IconWidget(icon: Icons.lock, color: Colors.white),
        onTap: () => {},
      );

  Widget buildSecurity(BuildContext context) => SimpleSettingsTile(
        title: 'Security',
        subtitle: '',
        leading:const  IconWidget(icon: Icons.security, color: Colors.white),
        onTap: () => {},
      );

  Widget buildAccountInfo(BuildContext context) => SimpleSettingsTile(
        title: 'Account Info',
        subtitle: '',
        leading: const IconWidget(icon: Icons.text_snippet, color: Colors.white),
        onTap: () => {},
      );
}
