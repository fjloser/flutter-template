import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../models/dio_model/response.dart';
import 'api_exception.dart';

final DateTime dateTime = DateTime.now();

class DioResponse extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    assert(() {
      debugPrint('$dateTime：response：${response.statusCode}');
      return true;
    }());
    if (response.statusCode == 200) {
      ResponseData responseData = ResponseData.fromJson(response.data);
      response.data = responseData.data;
      response.statusCode = responseData.code;
      response.statusMessage = responseData.message;
      if (responseData.success) {
        return handler.resolve(response);
      } else {
        /// hack 这里也可以使用handler.reject直接返回错误，具体看处理错误方法怎么写
        /// 如果错误处理写到service里面，建议直接返回 handler.reject(err)
        /// 如果错误处理下面，建议采用throw方式，代码更简洁
        throw DioException(
            requestOptions: response.requestOptions,
            response: response,
            error: responseData.message,
            type: DioExceptionType.badResponse);
      }
    } else {
      throw DioException(
          requestOptions: response.requestOptions,
          error: ResponseException(code: response.statusCode));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    /// 处理后端某些错误通过http状态码展示，并不是通过返回业务状态码
    if (err.response != null) {
      ResponseData responseData = ResponseData.fromJson(err.response?.data);
      if (responseData.code != null) {
        err.response?.statusCode = responseData.code;
        err.response?.statusMessage = responseData.message;
      }
    }

    /// TODO 是否启用处理错误
    // handleError(err);
    assert(() {
      debugPrint(
          '│ ❌ ERROR [${err.response?.statusCode}] ${err.requestOptions.uri} type：${err.type}');
      return true;
    }());
    handler.reject(err);
  }

  void handleError(DioException err) {
    ApiException apiException = ApiException.fromDioError(err);
    // TODO 处理错误
    assert(() {
      debugPrint(apiException.toString());
      return true;
    }());
  }
}
