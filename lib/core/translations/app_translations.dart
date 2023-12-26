import 'package:get/get.dart';
import 'package:planner/core/translations/en.dart';
import 'package:planner/core/translations/ua.dart';

class AppTranslations extends Translations {
 @override
  Map<String, Map<String, String>> get keys => {
        'en_US': EN.translations,
        'uk_UA': UA.translations
      };
}