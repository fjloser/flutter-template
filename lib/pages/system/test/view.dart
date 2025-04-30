import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _TestViewGetX();
  }
}

class _TestViewGetX extends GetView<TestController> {
  const _TestViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/demo');
          },
          child: Text('testPage')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
      init: TestController(),
      id: "test",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("test")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
