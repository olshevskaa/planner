import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocaleService extends GetxService {
  final _box = Hive.box('settings');
  final _key = 'locale';
  late String _locale;

  String get locale => _locale;

  @override
  void onInit() {
    super.onInit();
    _locale = _box.get(_key, defaultValue: 'en');
  }

  void switchLocale(String? locale) {
    if (locale != null) {
      _box.put(_key, locale);
      _locale = locale;
      final String countryCode = locale == 'en' ? 'US' : 'UA';
      Get.updateLocale(Locale(locale, countryCode));
    }
  }
}
