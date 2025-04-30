import 'package:get/get.dart';

import '../pages/system/splash/controller.dart';
import 'app_home/controller.dart';

class StateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppHomeController>(() => AppHomeController());
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
