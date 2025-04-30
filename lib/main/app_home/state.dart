import 'package:get/get.dart';

class AppHomeState {
  final _currentIndex = 0.obs;
  set currentIndex(value) => _currentIndex.value = value;
  get currentIndex => _currentIndex.value;
}
