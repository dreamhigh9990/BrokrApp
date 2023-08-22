import 'package:flutter/material.dart';

class LegalPage extends StatelessWidget {
  static String name = '/legal-page';

  const LegalPage({super.key});

  Widget _tile(title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: Column(
        children: [
          _tile('Terms & Conditions'),
          _tile('Privacy Policy'),
        ],
      ),
    );
  }
}
