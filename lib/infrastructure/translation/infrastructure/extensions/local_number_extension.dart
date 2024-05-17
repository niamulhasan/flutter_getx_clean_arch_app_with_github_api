


import 'package:get/get.dart';
import '../app_translation_data.dart';

extension LocalNumberExtension on num {
  String get tr {
    String? currentLocale = Get.locale?.languageCode;
    if(currentLocale == null) {
      return toString();
    }
    List<String> availableLocales = AppTranslationData.numbersMap.keys.toList();
    if (availableLocales.contains(currentLocale)) {
      // return AppTranslationData.numbersMap[currentLocale]![toInt()]!;
      String translatedNumber = "";
      for (var i = 0; i < toString().length; i++) {
        translatedNumber += AppTranslationData.numbersMap[currentLocale]![int.parse(toString()[i])].toString();
      }
      return translatedNumber;
    }
      return toString();
  }
}