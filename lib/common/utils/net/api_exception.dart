import 'package:dio/dio.dart';

/// 处理Dio出现的各种情况错误
class ApiException implements Exception {
  final String? message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: '连接超时，请检查网络',
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        if (error.response?.statusMessage != null) {
          return ApiException(
            message: error.response?.statusMessage,
            statusCode: error.response?.statusCode,
            data: error.response?.data,
          );
        }
        return ApiException(
          message: _handleError(error.response?.statusCode),
          statusCode: error.response?.statusCode,
          data: error.response?.data,
        );
      case DioExceptionType.cancel:
        return ApiException(
          message: '请求已取消',
          statusCode: error.response?.statusCode,
        );
      default:
        return ApiException(
          message: '网络请求失败，请稍后重试',
          statusCode: error.response?.statusCode,
        );
    }
  }

  static String _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return '请求错误';
      case 401:
        return '未授权，请登录';
      case 403:
        return '拒绝访问';
      case 404:
        return '请求地址出错';
      case 408:
        return '请求超时';
      case 500:
        return '服务器内部错误';
      case 501:
        return '服务未实现';
      case 502:
        return '网关错误';
      case 503:
        return '服务不可用';
      case 504:
        return '网关超时';
      case 505:
        return 'HTTP版本不受支持';
      default:
        return '请求失败，错误码：$statusCode';
    }
  }

  @override
  String toString() => 'ApiException: $message (Status Code: $statusCode)';
}
