import 'package:get/get.dart';
import '../../main/app_home/index.dart';
import '../../pages/demo/index.dart';
import '../../pages/index.dart';
import 'names.dart';

class RoutePages {
  static String initial = RouteNames.main;
  // 列表
  static List<GetPage> list = [
    GetPage(
        name: RouteNames.main,
        page: () => AppHome(),
        binding: AppHomeBinding()),
    GetPage(
        name: RouteNames.demo, page: () => DemoPage(), binding: DemoBinding()),
    GetPage(
        name: RouteNames.splash,
        page: () => SplashPage(),
        binding: SplashBinding()),
  ];
}
