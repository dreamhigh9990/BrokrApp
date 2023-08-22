import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../controllers/global_controller.dart';
import 'api_utils.dart';
import 'map_utils.dart';

class RequestUtils {
  final tag = 'Request-Utils';
  final ctr = Get.find<GlobalController>();

  late Map<String, String> _headers;

  _printRequest(String url, Map<String, dynamic>? params) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    debugPrint("URL: $url");
    debugPrint("Q: ${encoder.convert(params ?? {})}");
    debugPrint("H: ${encoder.convert(_headers)}");
  }

  Uri _defineUriUrl({
    required String path,
    String? newUriPath,
    Map<String, dynamic>? params,
  }) {
    if (newUriPath != null) return Uri.https(newUriPath, path, params);
    return Uri.https(ApiUtils.apiUrl, 'api/$path', params);
  }

  _checkHeaders(Map<String, String>? newHeaders, bool? encodeBody) {
    _headers = {
      ApiUtils.tokenField: ApiUtils.tokenValue ?? 'empty',
      // ApiUtils.authField: getUser() != null ? getUser()!.id : 'empty',
    };
    if (encodeBody ?? false) {
      _headers[HttpHeaders.contentTypeHeader] = 'application/json';
    }
    if (newHeaders != null && newHeaders.isNotEmpty) {
      _headers.addAll(newHeaders);
    }
  }

  Stream<dynamic> get(
    String path, {
    String? newUriPath,
    Map<String, String>? additionalHeaders,
    Map<String, String>? params,
  }) {
    _checkHeaders(additionalHeaders, null);
    return _newGetRequest(path, newUrl: newUriPath, params: params)
        .map((response) {
      debugPrint(response.body);
      return json.decode(response.body);
    }).handleError((error) {
      debugPrint(error.toString());
      throw error is Map<String, dynamic>
          ? error
          : {
              'title': tag,
              'message':
                  'A communication error has occurred, we are working to resolve it.'
            };
    });
  }

  Stream<dynamic> post(
    String path, {
    String? newUriPath,
    Map<String, String>? additionalHeaders,
    Map<String, dynamic>? body,
    bool encodeBody = false,
  }) {
    _checkHeaders(additionalHeaders, encodeBody);
    return _newPostRequest(path,
            newUrl: newUriPath, body: body, encodeBody: encodeBody)
        .map((response) {
      debugPrint(response.body);
      return json.decode(response.body);
    }).handleError((error) {
      debugPrint(error.toString());
      throw error is Map<String, dynamic>
          ? error
          : {
              'title': tag,
              'message':
                  'A communication error has occurred, we are working to resolve it.'
            };
    });
  }

  Stream<dynamic> multipartRequest(
    String path, {
    String? newUrl,
    Map<String, String>? additionalHeaders,
    Map<String, String>? body,
    required Map<String, File> files,
  }) {
    _checkHeaders(additionalHeaders, null);
    return Stream.fromFuture(_newMultipartRequest(path,
            newUrl: newUrl, body: body, files: files))
        .handleError((error) {
      throw error is Map<String, dynamic>
          ? error
          : {
              'title': tag,
              'message':
                  'A communication error has occurred, we are working to resolve it.'
            };
    });
  }

  Stream<http.Response> _newGetRequest(
    String path, {
    String? newUrl,
    Map<String, String>? params,
  }) {
    var url = _defineUriUrl(path: path, newUriPath: newUrl, params: params);
    var client = http.Client();
    _printRequest(url.toString(), params);
    return Stream.fromFuture(client.get(url, headers: _headers))
        .map((response) {
      return response;
    }).handleError(
      (error) {
        debugPrint(error.toString());
        throw {
          'title': 'UPS...',
          'message':
              'A communication error has occurred, we are working to resolve it.'
        };
      },
    );
  }

  Stream<http.Response> _newPostRequest(
    String path, {
    String? newUrl,
    Map<String, dynamic>? body,
    required bool encodeBody,
  }) {
    var url = _defineUriUrl(path: path, newUriPath: newUrl);
    var client = http.Client();
    _printRequest(url.toString(), body);
    return Stream.fromFuture(client.post(url,
            body: encodeBody ? json.encode(body) : body, headers: _headers))
        .map((response) {
      return response;
    }).handleError(
      (error) {
        debugPrint(error.toString());
        throw {
          'title': 'UPS...',
          'message':
              'A communication error has occurred, we are working to resolve it.'
        };
      },
    );
  }

  Future<dynamic> _newMultipartRequest(
    String path, {
    String? newUrl,
    Map<String, String>? body,
    required Map<String, File> files,
  }) async {
    var url = _defineUriUrl(path: path, newUriPath: newUrl);
    var client = http.MultipartRequest("POST", url);

    client.fields.addAll(body ?? {});
    client.headers.addAll(_headers);
    _printRequest(url.toString(), body);

    files.forEach((key, file) async {
      var multipartFile = await http.MultipartFile.fromPath('key', file.path);
      client.files.add(multipartFile);
    });
    var streamResp = await client.send();
    if (streamResp.statusCode == 200) {
      var responseData = await streamResp.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      debugPrint(responseString);
      return json.decode(responseString);
    } else {
      return Future.error(
        ErrorModel(
          module: tag,
          message:
              'A communication error has occurred, we are working to resolve it.',
          code: 0,
        ),
      );
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
