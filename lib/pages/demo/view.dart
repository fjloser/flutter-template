import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class DemoPage extends GetView<DemoController> {
  const DemoPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('返回')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoController>(
      init: DemoController(),
      id: "demo",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("demo")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
