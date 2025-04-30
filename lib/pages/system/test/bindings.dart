import 'package:get/get.dart';

import 'controller.dart';

class TestBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestController>(() => TestController());
  }
}
