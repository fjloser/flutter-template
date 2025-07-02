import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../common/configs/app.dart';
import 'app.dart';

class Application {
  Application.runApplication({
    EnvTag? envTag,
    String? apiUrl,
    Platform? platform,
    bool? proxyEnable,
    String? proxyUrl,
    bool? throwErrorEnable,
    bool? pushErrToSentry,
    String? sentryDNS,
  }) {
    /// 初始化环境变量，可以添加运行文件，也可修改配置文件
    EnvConfig.envTag = envTag ?? EnvConfig.envTag;
    EnvConfig.apiUrl = apiUrl ?? EnvConfig.apiUrl;
    EnvConfig.platform = platform ?? EnvConfig.platform;
    EnvConfig.proxyEnable = proxyEnable ?? EnvConfig.proxyEnable;
    EnvConfig.proxyUrl = proxyUrl ?? EnvConfig.proxyUrl;
    EnvConfig.throwErrorEnable = throwErrorEnable ?? EnvConfig.throwErrorEnable;
    EnvConfig.pushErrToSentry = pushErrToSentry ?? EnvConfig.pushErrToSentry;
    EnvConfig.sentryDNS = sentryDNS ?? EnvConfig.sentryDNS;

    
    if (EnvConfig.pushErrToSentry) {
      FlutterError.onError = (FlutterErrorDetails flutterErrorDetail) async {
        await Sentry.captureException(
          flutterErrorDetail.exception,
          stackTrace: flutterErrorDetail.stack,
        );
      };
      PlatformDispatcher.instance.onError = (error, stack) {
        Sentry.captureException(error, stackTrace: stack);
        return true;
      };
      try {
        debugPrint('开始初始化 Sentry');

        /// 初始化 Sentry
        SentryFlutter.init(
          (options) {
            options.dsn = EnvConfig.sentryDNS;
            options.tracesSampleRate = 1.0;

            if (EnvConfig.envTag == EnvTag.dev) {
              /// 是否打印输出 Sentry 日志
              options.debug = true;
            }
          },
          appRunner: () => runApp(App()),
        );
        debugPrint('Sentry 初始化成功');
      } catch (e) {
        debugPrint('Sentry 初始化失败: $e');
        runApp(App());
      }
    } else {
      runApp(App());
    }
  } // 启动应用程序
}
