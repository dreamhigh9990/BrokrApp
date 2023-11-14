// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'widgets/header_bar_widget.dart';

class AddressGooglePlace extends StatefulWidget {
  final String titleTextField;
  String? titleAppBar;
  AddressGooglePlace({
    super.key,
    required this.titleTextField,
    this.titleAppBar = "Location",
  });
  @override
  _AddressGooglePlaceState createState() => _AddressGooglePlaceState();
}

class _AddressGooglePlaceState extends State<AddressGooglePlace> {
  TextEditingController controller = TextEditingController();
  List<String> _predictions = [];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _searchPlaces(String input) async {
    const apiKey =
        'AIzaSyBunVYwlxf7Lyq5d4B10tmOoUxBRrt4QL4'; // Replace with your Google Places API key
    const endpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';

    final response = await http
        .get(Uri.parse('$endpoint?input=$input&types=address&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final predictions = data['predictions'] as List<dynamic>;

      setState(() {
        _predictions = predictions
            .map<String>((prediction) => prediction['description'] as String)
            .toList();
      });
    } else {
      setState(() {
        _predictions = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(0.0),
        children: [
          const HeaderBarWidget(title: "Where?"),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
                top: 10.0,
                bottom: 10.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 1),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: controller,
                    onChanged: _searchPlaces,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.location_on_outlined,
                            color: Color(0xFF2E3E5C)),
                        hintText: widget.titleTextField,
                        hintStyle: TextStyle(fontSize: 12)),
                  ),
                ),
                Container(
                  height: 65,
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 0.65,
                      ),
                    ),
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 15.0,
                        ),
                        SvgPicture.asset("assets/icons/current_location.svg"),
                        const SizedBox(
                          width: 15.0,
                        ),
                        const Text(
                          "Current Location",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ]),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _predictions.length,
                  itemBuilder: (context, index) {
                    final prediction = _predictions[index];

                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.65,
                          ),
                        ),
                      ),
                      child: ListTile(
                        minLeadingWidth: 0.0,
                        minVerticalPadding: 0.0,
                        leading:
                            SvgPicture.asset("assets/icons/clock_location.svg"),
                        title: Text(
                          prediction,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          controller.text = prediction;
                          setState(() {
                            _predictions = [];
                          });
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
