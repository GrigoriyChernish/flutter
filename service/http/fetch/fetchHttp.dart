import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../config/url.dart';
import 'Response.dart';

class Fetch {
  Map<String, String> headers = {'X-Requested-With': 'XMLHttpRequest'};

  Fetch({Map<String, String> header = const {}}) {
    if (header.isNotEmpty) {
      headers.addAll(header);
    }
  }

  Future<Response> post(String url, Map<String, dynamic> body) async {
    try {
      http.Response response = await http.post(UrlApi(url).uri, headers: this.headers, body: body);
      return Response.fromJson(jsonDecode(response.body));
    } catch (e) {
      return Response.error(error: true, message: e.toString());
    }
  }

  Future<Response> get(String url) async {
    try {
      http.Response response = await http.get(UrlApi(url).uri, headers: this.headers);
      return Response.fromJson(jsonDecode(response.body));
    } catch (e) {
      return Response.error(error: true, message: e.toString());
    }
  }
}
