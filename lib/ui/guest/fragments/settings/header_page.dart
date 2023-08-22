
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import '../../../widgets/icon_widget.dart';

const List<String> list = <String>['Guest', 'Host', 'Brokr'];

class HeaderFragment extends StatelessWidget {
  static const keyDarkMode = 'key-dark-mode';
  static const name = "Raymond Mauge";
  static const phone = "raymond@gmail.com";

  const HeaderFragment({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          /*   buildHeader(), */
          const SizedBox(height: 16),
          buildUser(context),
          //buildDarkMode(),
        ],
      );

  Widget buildDarkMode() => SwitchSettingsTile(
        settingKey: keyDarkMode,
        leading: const IconWidget(
          icon: Icons.dark_mode,
          color: Colors.white,
        ),
        title: 'Dark Mode',
        onChange: (_) {},
      );

  Widget buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          SizedBox(
            height: 36,
            width: 100,
          ),
          Text(
            'Profile',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          DropdownButtonExample(),
        ],
      );

  Widget buildUser(BuildContext context) => InkWell(
        onTap: () {},
        child: Row(
          children: [
            ClipOval(
              child: Image.network(
                'https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60',
                fit: BoxFit.cover,
                width: 98,
                height: 98,
              ),
            ),
            const SizedBox(width: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  phone,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
     
      ),
      padding: const EdgeInsets.all(5.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        underline: const SizedBox.shrink(),
        icon: const Icon(Icons.expand_more),
        onChanged: (String? value) {
        
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
