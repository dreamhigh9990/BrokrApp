import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUtils {
  static String apiUrl = dotenv.env['API_URL'].toString();
  static String imgUrl = dotenv.env['IMAGES_URL'].toString();
  static const status = 'status';
  static const success = 'success';
  static const error = 'error';
  static const data = 'data';
  static const message = 'message';
  static const tokenField = 'Api-Token';
  static const authField = 'Auth-User';
  static String? tokenValue = dotenv.env['API_TOKEN'];
}
