import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class FormUtils {
  static String? validateEmail(String? value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Email invalido';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? value) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (value!.length < 10) {
      return 'Teléfono invalido 1';
    } else if (!regExp.hasMatch(value)) {
      return 'Teléfono invalido 2';
    }
    return null;
  }

  static String? validateEmptyField(String? value) {
    if (value!.isNotEmpty) {
      return null;
    } else {
      return 'Este campo no puede quedar vacío';
    }
  }

  static String? validatePassword(String? value) {
    return value != null && value.length >= 8
        ? null
        : 'La contraseña debe tener al menos 8 caracteres.';
  }

  static double checkDoubleValue(dynamic value) {
    if (value == null) return 0.0;
    if (value.toString().contains('.')) {
      return double.parse(value.toString());
    } else {
      return double.parse('$value.0');
    }
  }

  static String dateToTimestampId(DateTime date) {
    return DateFormat('yyyy-MM-dd_HH:mm:ss').format(date);
  }

  static String dateToTimestamp(DateTime date) {
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  static String dateToStrDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  //Funcion para obtener tiempo de duracion en formato PT1H11S (Youtube)
  static int convertTime(String duration) {
    RegExp regex = RegExp(r'(\d+)');
    List<String> a =
        regex.allMatches(duration).map((e) => e.group(0)!).toList();

    if (duration.contains('M') &&
        !duration.contains('H') &&
        !duration.contains('S')) {
      a = ["0", a[0], "0"];
    }

    if (duration.contains('H') && !duration.contains('M')) {
      a = [a[0], "0", a[1]];
    }
    if (duration.contains('H') &&
        !duration.contains('M') &&
        !duration.contains('S')) {
      a = [a[0], "0", "0"];
    }

    int seconds = 0;

    if (a.length == 3) {
      seconds = seconds + int.parse(a[0]) * 3600;
      seconds = seconds + int.parse(a[1]) * 60;
      seconds = seconds + int.parse(a[2]);
    }

    if (a.length == 2) {
      seconds = seconds + int.parse(a[0]) * 60;
      seconds = seconds + int.parse(a[1]);
    }

    if (a.length == 1) {
      seconds = seconds + int.parse(a[0]);
    }
    return seconds;
  }

  static String printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  static String getRandomString(int length) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  }

  static Future<bool> awaitPage(Duration timeDelay) async {
    await Future.delayed(timeDelay, () {});
    return true;
  }

  static String dateToStrLongDate(DateTime date) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('EEEEE, dd MMM yyyy', 'es_ES');
    return formatter.format(date);
  }

  static String getDayInitials(DateTime date) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('EEEEE', 'es_ES');
    return formatter.format(date).substring(0, 2).toUpperCase();
  }

  static String getNumberDay(DateTime date) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('dd', 'es_ES');
    return formatter.format(date);
  }

  static String dateToStrLongDate2(DateTime date) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('EEEEE\ndd/MM/yyyy', 'es_ES');
    return formatter.format(date);
  }

  static String dateToStrTextDate(DateTime date) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('dd MMM yyyy - HH:mm', 'es_ES');
    return formatter.format(date.toLocal());
  }

  static String dateToTimeTextDate(DateTime date) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('HH:mm', 'es_ES');
    return formatter.format(date.toLocal());
  }

  static String dateToStrShortTextDate(DateTime date, bool showYear) {
    initializeDateFormatting('es_ES');
    var formatter = DateFormat('dd MMM${showYear ? ' yy' : ''}', 'es_ES');
    return formatter.format(date.toLocal());
  }

  static Future<String> findLocalPath() async {
    final directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();
    return directory!.path;
  }

  static callPhoneNumber(String number) async {
    var phoneURl = "tel:$number";
    if (!await launchUrl(Uri.parse(phoneURl))) {
      throw 'Could not launch $phoneURl';
    }
  }

  static openwhatsapp(String number, String message) async {
    // var whatsappURl = "https://wa.me/$number?text=$message";
    var whatsappURl = "whatsapp://send?text=$message&phone=$number";
    if (!await launchUrl(Uri.parse(whatsappURl))) {
      Get.snackbar('Error', 'whatsapp no installed',
          colorText: Colors.white, snackPosition: SnackPosition.BOTTOM);
    }
  }

  static Future<void> openUrlWeb(String urlWeb) async {
    final Uri url = Uri.parse(urlWeb);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openLocationUrl(double latitude, double longitude) async {
    var locationUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude%2C$longitude";
    final Uri url = Uri.parse(locationUrl);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  static Future<void> sendEmail(String email,
      {Map<String, String>? params}) async {
    //Exaple params: {'subject': 'subject', 'body': 'body'}
    Map<String, String> parms = params ?? {};

    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      query: parms.entries
          .map((MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
          .join('&'),
    );
    launchUrl(emailLaunchUri);
  }

  static double calculatePercentValue(double value, int percent) {
    return value * ((percent / 100));
  }

  static String formatIntNumber(int number) {
    return NumberFormat.decimalPattern('eu').format(number);
  }

  static String formatDoubleNumber(double number) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return oCcy.format(number);
  }

  static int randomNumberGenerator(int max) {
    var rng = Random();
    return rng.nextInt(max) + 1;
  }

  static String getRandomImagePath() {
    return 'assets/images/splash/splash_${randomNumberGenerator(9)}.jpg';
  }
}
