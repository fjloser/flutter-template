import 'dart:ui';

import 'package:get/get.dart';

import 'lang/en_US.dart';
import 'lang/zh_CN.dart';
import 'lang/zh_HK.dart';

class TranslationService extends Translations {
  static Locale? get locale => Get.deviceLocale;
  static final fallbackLocale = Locale('zh', 'CN');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
        'zh_HK': zh_HK,
      };
}
