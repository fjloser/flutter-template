import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_getx_template/common/utils/net/dio_response.dart';
import 'package:flutter_getx_template/common/configs/times.dart';
import 'dio_interceptor.dart';

class DioClient extends DioForNative {
  DioClient({String? baseUrl}) {
    options = BaseOptions(
      connectTimeout: Duration(milliseconds: DefaultTimes.DEFAULT_REQUEST_TIME),
      receiveTimeout: Duration(milliseconds: DefaultTimes.DEFAULT_REQUEST_TIME),
      sendTimeout: Duration(milliseconds: DefaultTimes.DEFAULT_REQUEST_TIME),
      baseUrl: baseUrl ?? "http://10.10.10.18/xz-base/",
    );
    interceptors.add(DioInterceptor()); // 请求拦截
    interceptors.add(DioResponse()); // 响应拦截
    // 服务端设置cookie，需不需要看情况得
    // final cookieJar = CookieJar();
    // interceptors.add(CookieManager(cookieJar));

    // proxy();
  }

  /// 代理抓包，测试阶段可能需要
  // void proxy() {
  //   if (EnvConfig.proxyEnable) {
  //     if (EnvConfig.caughtAddress?.isNotEmpty ?? false) {
  //       (httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
  //         final client = HttpClient();
  //         client.findProxy = (uri) => 'PROXY ' + EnvConfig.caughtAddress!;

  //         client.badCertificateCallback = (cert, host, port) => true;
  //         return client;
  //       };
  //     }
  //   }
  // }
}
