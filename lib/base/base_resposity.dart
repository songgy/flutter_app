import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class BaseResposity {
  static Dio _mDio;

  static init() {
//    BaseOptions options = BaseOptions(connectTimeout: 10);
    _mDio = Dio();
  }

  static Future<String> getHttp() async {
    try {
      Response response = await _mDio.get("https://www.baidu.com");
      return response.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
