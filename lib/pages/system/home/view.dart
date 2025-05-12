import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HomeViewGetX();
  }
}

class _HomeViewGetX extends GetView<HomeController> {
  const _HomeViewGetX();

  // 主视图
  Widget _buildView() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
          decoration: BoxDecoration(border: Border.all(width: 1.rpx)),
          child: SizedBox(
            height: 200.rpx,
            width: 750.rpx,
            child: Text(
              "HomePage",
              style: TextStyle(fontSize: 32.rpx),
            ),
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: "home",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("home")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
