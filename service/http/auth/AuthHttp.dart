import 'dart:convert';

import 'package:flutter_app/model/notifications.dart';

import '../../../config/path.dart';
import '../fetch/fetchHttp.dart';
import '../fetch/Response.dart';

class AuthHttp {
  static late Map<String, String> header = {};

  AuthHttp.headers(Map<String, String> headers) {
    AuthHttp.header = headers;
  }

  static Future<Response> logIn(Map<String, dynamic> data) async {
    Response response = await Fetch(header: AuthHttp.header).post(PathApi.login, data);
    if (response.status == 200) {
      Notify notify = Notify();
      notify.setNotify(response.message, NotifyStatus.success);
      print(notify.status);
    }
    return response;
  }

  static Future<Response> register(Map<String, dynamic> data) async {
    return await Fetch().post(PathApi.register, data);
  }

  static Future<Response> forgot(Map<String, dynamic> data) async {
    return await Fetch().post(PathApi.forgot, data);
  }

  static logout() async {
    return await Fetch().get(PathApi.logout);
  }
}
