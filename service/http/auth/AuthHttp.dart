import 'package:flutter_app/config/path.dart';

import '../fetch/fetchHttp.dart';
import '../model/Response.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthHttp {
  static late Map<String, String> header;

  AuthHttp.headers(Map<String, String> headers) {
    AuthHttp.header = headers;
  }

  static Future<Response> logIn(Map<String, dynamic> data) async {
    return await Fetch(header: AuthHttp.header).post(PathApi.login, data);
  }

  static Future<Response> register(Map<String, dynamic> data) async {
    return await Fetch().post(PathApi.register, data);
  }

  static Future<Response> forgot(Map<String, dynamic> data) async {
    return await Fetch().post(PathApi.forgot, data);
  }

  static Future<Response> logout() async {
    return await Fetch().get(PathApi.logout);
  }
}
