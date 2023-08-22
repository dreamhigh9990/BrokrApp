import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  static String name = '/privacy-sharing-page';

  const PrivacyPage({super.key});

  Widget _tile(context, String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy and Sharing'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          _tile(
            context,
            'Request Personal Data',
            'We will send all your personal data in a file.',
          ),
          _tile(
            context,
            'Delete Your Account',
            'If you do, your data will be permanently deleted.',
          ),
        ],
      ),
    );
  }
}
