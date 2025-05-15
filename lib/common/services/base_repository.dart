import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/common/index.dart';

/// json转化为对应的model
typedef JsonCoverEntity<T> = T Function(Map<String, dynamic> json);

abstract class BaseRepository {
  @override
  DioClient get dio;
  Future<T?> httpRequest<T>(
      {required Future<Response> Function() future,
      required JsonCoverEntity coverEntity,
      CancelToken? cancelToken,
      bool loading = false}) async {
    T? model;
    Timer? timer;
    bool loadingShown = false;
    try {
      if (loading) {
        timer = Timer(Duration(milliseconds: 500), () {
          loadingShown = true;
          EasyLoading.show();
        });
      }
      Response response = await future();
      model = coverEntity(response.data);
    } on DioException catch (dioEx) {
      // 请求异常也可以在封装dio的地方统一处理，进行弹窗显示
      assert(() {
        debugPrint("DioException: ${dioEx.message}");
        return true;
      }());
      handleError(dioEx);
    } finally {
      timer?.cancel();
      if (loadingShown) {
        EasyLoading.dismiss();
      }
    }
    return model;
  }

  void handleError(DioException dioEx) {
    // TODO 实现错误处理
  }

  /// ✨ 判断某种异常是否可以重试
  bool _shouldRetry(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.unknown:
        return true;
      default:
        return false;
    }
  }
}
