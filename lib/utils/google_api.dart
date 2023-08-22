import 'dart:convert';

import 'package:http/http.dart' as http;

class GoogleApi {
  static const String baseUrl = "https://maps.googleapis.com/maps/api";
  static const String urlSearchPlace = '$baseUrl/place/autocomplete/json';

  static const String apiKey = 'AIzaSyBunVYwlxf7Lyq5d4B10tmOoUxBRrt4QL4';

  Future<List<String>> searchPlaces(String input) async {
    final response = await http.get(
        Uri.parse('$urlSearchPlace?input=$input&types=address&key=$apiKey'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final predictions = data['predictions'] as List<dynamic>;

      return predictions
          .map<String>((prediction) => prediction['description'] as String)
          .toList();
    } else {
      return [];
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    final url = '$baseUrl/geocode/json?latlng=$latitude,$longitude&key=$apiKey';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedJson = json.decode(response.body);
        final results = decodedJson['results'] as List<dynamic>;
        if (results.isNotEmpty) {
          final formattedAddress = results[0]['formatted_address'];
          return formattedAddress;
        }
      }
    } catch (e) {
      print('Error: $e');

      return 'Error: $e';
    }

    return 'No found direction';
  }
}
