import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:planner/core/themes/themes.dart';

class ThemeService extends GetxService {
  final _box = Hive.box('settings');
  final _key = 'isDarkMode';
  late bool _darkTheme;

  String get theme => _darkTheme ? 'dark' : 'light';

  @override
  void onInit() {
    super.onInit();
    _darkTheme = _box.get(_key, defaultValue: false);
  }

  void switchTheme(String? theme) {
    if (theme != null) {
      _darkTheme = theme == 'dark';
      if (_darkTheme) {
        Get.changeTheme(DarkTheme.orangeTheme);
      } else {
        Get.changeTheme(LightTheme.purpleTheme);
      }
    }
    _box.put(_key, _darkTheme);

    if (_darkTheme) {
      Get.changeTheme(DarkTheme.orangeTheme);
    } else {
      Get.changeTheme(LightTheme.purpleTheme);
    }
  }
}
