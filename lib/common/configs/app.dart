enum EnvTag {
  /// 开发
  dev,

  /// 预发布
  pre,

  /// 生产
  prod,
}

enum Platform {
  app,
  pc,
  web,
}

/// 系统设置
class EnvConfig {
  /// 是否是app主体, 用于是否需要引导页或者广告页
  static bool isAppMainPage = false;

  /// 环境标签
  static EnvTag envTag = EnvTag.dev;

  /// 服务 api
  static String apiUrl = 'https://api.example.com';

  /// 应用使用平台
  /// 可选值：app, web, pc
  static Platform platform = Platform.app;
  static bool proxyEnable = false;

  /// 抓包工具代理地址 + 端口号
  /// 格式：URL_ADDRESS  /// 格式：http://127.0.0.1:8888
  static String proxyUrl = '';

  /// 异常抛出，在终端显示，开发阶段可快速定位问题，会阻断后续代码执行
  /// 注意：在生产环境中，不要开启，否则会影响性能
  static bool throwErrorEnable = false;

  /// 是否开启异常上报Sentry
  static bool pushErrToSentry = false;

  /// 异常上报Sentry的DSN
  static String sentryDNS = '';
}
