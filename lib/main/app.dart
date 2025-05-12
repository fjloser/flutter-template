import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../common/index.dart';
import '../pages/system/splash/view.dart';
import 'app_home/view.dart';
import 'bindings.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    EasyLoadingTheme.initial();
    return GetMaterialApp(
      title: 'appTitle'.tr,
      // 路由
      // initialRoute: RoutePages.initial,
      getPages: RoutePages.list,
      builder: EasyLoading.init(),

      /// 按照此处进行翻译
      locale: TranslationService.locale,

      /// 翻译失败时的默认语言
      fallbackLocale: TranslationService.fallbackLocale,

      /// 翻译
      translations: TranslationService(),

      /// 跟踪导航事件
      navigatorObservers: [
        SentryNavigatorObserver(),
      ],
      initialBinding: StateBinding(),
      home: PopScope(
          // WillPopScope 3.16中过时，使用PopScope替换
          canPop: false,
          onPopInvokedWithResult: (bool didPop, result) {
            if (didPop) {
              return;
            }

            // 这里使用 Navigator.of(context).pop(); 是无效的
            // 使用SystemNavigator.pop() 或者 exit()

            // SystemNavigator.pop()：用于在导航堆栈中弹出最顶层的页面，并在导航堆栈为空时退出应用程序
            // 平台兼容性：如果你只用Flutter做Android应用，优先使用 SystemNavigator.pop() 来退出应用程序。

            // exit()：直接终止应用程序的运行。
            // 平台兼容性：适用于所有平台（Android、iOS等）

            // 写逻辑代码
            // ...

            exit(0); // 退出应用
          },
          child: AppTransfer()),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppTransfer extends StatelessWidget {
  const AppTransfer({super.key});
  @override
  Widget build(BuildContext context) {
    late Widget child;

    /// 启动页可能还需要通过sharedPreferences等方式判断是否需要跳转
    if (EnvConfig.isAppMainPage) {
      child = const AppHome();
    } else {
      // TODO: 引导页或者广告页
      child = const SplashPage();
    }
    return child;
  }
}
