import 'dart:convert';

import 'package:flutter/cupertino.dart';

class MapUtils {
  Map<String, dynamic> stringToMap(String data) {
    debugPrint(data);
    Map<String, dynamic> map = json.decode(data);
    return map;
  }

  String objectToString(Object object) {
    return json.encode(object);
  }
}

class ErrorModel {
  String? module;
  String? message;
  int? code;

  ErrorModel({this.module, this.message, this.code});
}
