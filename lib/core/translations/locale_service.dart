import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocaleService extends GetxService {
  final _box = Hive.box('settings');
  final _key = 'locale';
  late String _locale;

  @override
  void onInit() {
    super.onInit();
    _locale = _box.get(_key, defaultValue: 'en');
  }

  void switchLocale() {
    if (_locale == 'en') {
      _box.put(_key, 'uk');
      _locale = 'uk';
      Get.updateLocale(const Locale('uk', 'UA'));
    } else {
      _box.put(_key, 'en');
      _locale = 'en';
      Get.updateLocale(const Locale('en', 'US'));
    }
  }
}