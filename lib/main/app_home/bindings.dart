import 'package:flutter_getx_template/pages/system/test/controller.dart';
import 'package:get/get.dart';

import '../../pages/system/home/controller.dart';
// import 'controller.dart';

class AppHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<TestController>(() => TestController(), fenix: true);
  }
}
