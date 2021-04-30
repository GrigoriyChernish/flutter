import 'dart:convert';

import 'package:flutter_app/config/url.dart';
import 'package:flutter_app/service/http/model/Response.dart';
import 'package:http/http.dart' as http;

class Fetch {
  Map<String, String> headers = {'X-Requested-With': 'XMLHttpRequest'};
  static String baseUrl = 'localhost:8000';

  Fetch({Map<String, String> header = const {}}) {
    if (header.isNotEmpty) {
      headers.addAll(header);
    }
  }

  Future<Response> post(String url, Map<String, dynamic> body) async {
    try {
      http.Response response =
          await http.post(UrlApi(url).uri, headers: this.headers, body: body);
      return Response.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      return Response.error(error: true);
    }
  }

  Future<Response> get(String url) async {
    try {
      http.Response response =
          await http.get(UrlApi(url).uri, headers: this.headers);
      return Response.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
      return Response.error(error: true);
    }
  }
}
