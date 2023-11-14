// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/normal_button.dart';

class AddressGooglePlace extends StatefulWidget {
  final String titleTextField;

  const AddressGooglePlace({super.key, required this.titleTextField});
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
    return Scaffold(
      appBar: const CustomBar(title: "Location", showLeading: true),
      body: Padding(
        padding: EdgeInsets.all(Get.context!.width * 0.035),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: controller,
                onChanged: _searchPlaces,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                      )),
                  suffixIcon: const Icon(Icons.my_location),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  labelText: widget.titleTextField,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: _predictions.length,
                itemBuilder: (context, index) {
                  final prediction = _predictions[index];

                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: index == _predictions.length - 1
                            ? const BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8),
                              )
                            : BorderRadius.circular(0),
                        border: Border.all(color: Colors.grey)),
                    child: ListTile(
                      minLeadingWidth: 0.0,
                      contentPadding: const EdgeInsets.all(0.0),
                      minVerticalPadding: 0.0,
                      leading: const Icon(Icons.location_on_outlined),
                      title: Text(prediction),
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: NormalButton(
            text: ("Done"),
            onTap: () {
              Get.back(result: {
                "data": controller.text.isEmpty == true ? "" : controller.text
              });
            },
            backgroundColor: ThemeUtils.colorPurple),
      ),
    );
  }
}
