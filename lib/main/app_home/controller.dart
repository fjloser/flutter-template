import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AppHomeController extends GetxController {
  AppHomeController();

  final state = AppHomeState();
  late PageController pageController;

  // tap
  void handleTap(int index) {
    Get.snackbar(
      "标题",
      "消息",
    );
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: state.currentIndex);
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }

  void onJumpToPage(int index) {
    state.currentIndex = index;
  }
}
