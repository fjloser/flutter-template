import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/common/index.dart';
import 'package:get/get.dart';

import '../utils/net/api_exception.dart';
import 'base_repository.dart';

class TestRepository extends BaseRepository {
  @override
  DioClient get dio => DioClient(baseUrl: "http://10.10.10.18/xz-base/");

  /// 是否需要重写通用处理错误
  @override
  handleError(dioEx) {
    ApiException apiException = ApiException.fromDioError(dioEx);
    EasyLoading.showError(
      apiException.message ?? "未知错误",
      duration: Duration(seconds: 2),
      maskType: EasyLoadingMaskType.custom,
    );
  }
}
