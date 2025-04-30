import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final DateTime dateTime = DateTime.now();

class DioInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

    final String token = await asyncPrefs.getString('token') ?? '';
    // TODO 测试使用固定值，正式使用请切换SharedPreferences
    options.headers['Authorization'] =
        'eyJhbGciOiJIUzUxMiJ9.eyJleHAiOjE3NDU4NjM1ODQsInN1YiI6ImFkbWluIiwiaWF0IjoxNzQ1ODIwMzg0OTg3fQ.ndCYSvlLrbKmmYZ8KfQT8--IDUHqJ8Di4VnAaibztaV64Grz61P5CU19TopopW87ce5rQua-Cds4PO9uQtuWCQ';
    if (token.isNotEmpty) {
      //   options.headers['Authorization'] = token;
    }

    /// 打印请求日志信息
    assert(() {
      debugPrint(
          "request:${options.method}\t url-->${options.baseUrl}${options.path}?${formattedUrl(options.queryParameters)}");
      return true;
    }());
    return handler.next(options);
  }

  ///格式化url,将post和get请求以get链接输出
  static String formattedUrl(params) {
    var urlParamsStr = "";
    if (params?.isNotEmpty ?? false) {
      var tempArr = [];
      params.forEach((k, v) {
        tempArr.add('$k=${v.toString()}');
      });
      urlParamsStr = tempArr.join('&');
    }
    return urlParamsStr;
  }
}
