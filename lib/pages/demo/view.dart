import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/extension/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class DemoPage extends GetView<DemoController> {
  const DemoPage({super.key});

  // 主视图
  Widget _buildView() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 100.px,
            width: 100.px,
            child:
                DecoratedBox(decoration: BoxDecoration(border: Border.all())),
          ),
          SizedBox(
              height: 100.0.rpx,
              width: 100.rpx,
              child: DecoratedBox(
                  decoration: BoxDecoration(border: Border.all()))),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('返回')),
        ],
      ),
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
