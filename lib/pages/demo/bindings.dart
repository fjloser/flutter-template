import 'package:get/get.dart';

import 'controller.dart';

class DemoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoController>(() => DemoController());
  }
}
