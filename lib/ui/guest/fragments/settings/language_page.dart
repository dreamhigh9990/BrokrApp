
import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  static String name = '/language-page';

  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  bool _translate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                'The system will automatically translate with the language that your system has',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            SwitchListTile.adaptive(
              value: _translate,
              onChanged: (value) {
                setState(() {
                  _translate = value;
                });
              },
              title: const Text(
                'Translate',
              ),
              activeColor: const Color(0x8A4B39EF),
              activeTrackColor: const Color(0x8A4B39EF),
              dense: false,
            ),
            const Spacer(flex: 20),
          ],
        ),
      ),
    );
  }
}
