import 'dart:ui';

import 'package:get/get.dart';

class SizeFit {
  static late double screenWidth;
  static late double screenHeight;
  static late double physicalWidth;
  static late double physicalHeight;
  static late double dpr;
  static late double statusHeight;
  static late double rpx;
  static late double px;
  static initialize({double size = 750}) {
    final windowIndo = PlatformDispatcher.instance;
    physicalWidth = PlatformDispatcher.instance.views.first.physicalSize.width;
    physicalHeight =
        PlatformDispatcher.instance.views.first.physicalSize.height;
    dpr = PlatformDispatcher.instance.views.first.devicePixelRatio;

    screenWidth = physicalWidth / dpr;
    screenHeight = physicalHeight / dpr;
    statusHeight = PlatformDispatcher.instance.views.first.padding.top / dpr;
    rpx = screenWidth / size;
    px = screenWidth / size * 2;
  }

  static double setRpx(num size) {
    return size * rpx;
  }

  static double setPx(num size) {
    // 返回物理像素对应的逻辑像素宽度，实现真正的“固定像素”
    return size * px;
  }
}
