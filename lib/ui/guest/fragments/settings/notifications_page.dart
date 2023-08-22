import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme_utils.dart';

class NotificationsPage extends StatefulWidget {
  static String name = '/notifications-page';

  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _push = false;
  bool _email = false;
  bool _location = false;

  Widget _switch({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChange,
  }) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: onChange,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      activeColor: const Color(0x8A4B39EF),
      activeTrackColor: const Color(0x8A4B39EF),
      dense: false,
      controlAffinity: ListTileControlAffinity.trailing,
      contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 16,
          ),
          child: Column(
            children: [
              _switch(
                title: 'Push Notifications',
                subtitle:
                    'Receive Push notifications from our application on a semi regular basis.',
                value: _push,
                onChange: (value) {
                  setState(() {
                    _push = value;
                  });
                },
              ),
              _switch(
                title: 'Email Notifications',
                subtitle:
                    'Receive email notifications from our marketing team about new features.',
                value: _email,
                onChange: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              _switch(
                title: 'Location Services',
                subtitle:
                    'Allow us to track your location, this helps keep track of spending and keeps you safe.',
                value: _location,
                onChange: (value) {
                  setState(() {
                    _location = value;
                  });
                },
              ),
              const Spacer(),
              NormalButton(
                  backgroundColor: ThemeUtils.colorPurple,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                text: 'Save',
                onTap: () {
                  Navigator.of(context).pop();
                },
                cornersRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
