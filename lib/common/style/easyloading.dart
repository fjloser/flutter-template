import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingTheme {
  static void initial() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..indicatorSize = 20.0
      ..radius = 20.0
      ..animationStyle = EasyLoadingAnimationStyle.opacity

      /// 设置padding
      // ..contentPadding = EdgeInsets.zero

      /// 字体大小
      ..fontSize = 10

      /// loading时背景色仅在EasyLoadingStyle.custom下生效
      ..loadingStyle = EasyLoadingStyle.custom
      ..progressColor = Colors.white
      ..backgroundColor = Colors.grey
      ..indicatorColor = Colors.white
      ..textColor = Colors.white

      /// 蒙层颜色仅EasyLoadingMaskType.custom下生效
      ..maskType = EasyLoadingMaskType.none
      // ..maskColor = Colors.grey.withValues(alpha: .5)
      ..maskColor = Colors.transparent

      // ..errorWidget =

      /// 允许loading时点击其他地方
      ..userInteractions = false
      ..dismissOnTap = true;

    /// 自定义动画需要自己实现
    // ..customAnimation = CustomAnimation();
  }
}
