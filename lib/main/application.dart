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

    /// dart 代码异常捕获包括同步和异步代码
    runZonedGuarded(() async {
      /// 确保依赖全部初始化完成
      WidgetsFlutterBinding.ensureInitialized();
      if (EnvConfig.pushErrToSentry) {
        try {
          debugPrint('开始初始化 Sentry');

          /// 初始化 Sentry
          await SentryFlutter.init(
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
    }, (Object error, StackTrace stack) async {
      if (EnvConfig.pushErrToSentry) {
        assert(() {
          debugPrint('执行了异常 上报：$error');
          return true;
        }());

        /// 使用第三方服务（例如Sentry）上报错误
        /// Sentry.captureException(error, stackTrace: stackTrace);
        await Sentry.captureException(
          error,
          stackTrace: stack,
        );
      }
    });
  } // 启动应用程序
}
