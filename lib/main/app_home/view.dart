import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/system/home/view.dart';
import '../../pages/system/test/view.dart';
import 'index.dart';

class AppHome extends GetView<AppHomeController> {
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              HomePage(),
              TestPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.red,
            currentIndex: controller.state.currentIndex, //第几个菜单选中
            type: BottomNavigationBarType.fixed, //如果有4个或者4个以上的
            onTap: (index) {
              controller.onJumpToPage(index);
              controller.pageController.jumpToPage(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "首页",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "购物车",
              ),
            ],
          ),
        ));
  }
}
