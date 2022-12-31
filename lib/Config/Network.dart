import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:medic_petcare/Utils/Storage.dart';
import 'package:medic_petcare/Utils/StorageKey.dart';

class Network {
  final String baseUrl = "https://petcare.berkahistiqomahfarm.com/api/";
  final String photoUrl = "https://petcare.berkahistiqomahfarm.com/upload/";
  Map<String, String> headers = {
    'content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future get({
    required String url,
    Map<String, String>? params,
    Map<String, String>? header,
    bool useToken = true,
  }) async {
    String sendUrl = baseUrl + url;
    List<String> keys = [];
    if (params != null) {
      for (var mapEntry in params.entries) {
        final key = mapEntry.key, value = mapEntry.value;
        keys.add("$key=$value");
      }
      String parameter = keys.join('&').toString();
      sendUrl = "$sendUrl?$parameter";
    }

    Map<String, String> sendHeader = {};
    if (header != null) {
      for (final mapEntry in header.entries) {
        final key = mapEntry.key, value = mapEntry.value;
        headers[key] = value;
      }
    }
    var tokenAuth = await Storage.get(tokenStorageKey);
    if (tokenAuth.toString().isNotEmpty && useToken) {
      headers['Authorization'] = "Bearer $tokenAuth";
    }
    headers.addAll(sendHeader);
    http.Response response = await http.get(
      Uri.parse(sendUrl),
      headers: headers,
    );
    return json.decode(response.body);
  }

  Future<void> post({
    required String url,
    Map<String, dynamic>? body,
    List? list,
    Map<String, String>? header,
    bool useToken = true,
    bool isList = false,
  }) async {
    Map<String, String> sendHeader = {};
    var sendBody;
    isList ? sendBody = [] : sendBody = {};
    String sendUrl = baseUrl + url;
    if (header != null) {
      for (final mapEntry in header.entries) {
        final key = mapEntry.key, value = mapEntry.value;

        headers[key] = value;
      }
      headers.addAll(sendHeader);
    }

    if (isList) {
      sendBody = list!;
    } else {
      if (body != null) {
        for (final mapEntry in body.entries) {
          final key = mapEntry.key, value = mapEntry.value;
          sendBody[key] = value;
        }
      }
    }

    var tokenAuth = await Storage.get(tokenStorageKey);
    if (tokenAuth.toString().isNotEmpty && useToken) {
      headers['Authorization'] = "Bearer $tokenAuth";
    }
    http.Response response = await http.post(
      Uri.parse(sendUrl),
      body: json.encode(sendBody),
      headers: headers,
    );
    try {
      return json.decode(response.body);
    } catch (e) {
      return json.decode(json.encode({
        "data": response.body,
      }));
    }
  }
}
