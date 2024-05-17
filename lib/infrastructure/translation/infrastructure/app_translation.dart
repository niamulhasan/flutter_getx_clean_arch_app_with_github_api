import 'package:get/get.dart';
import 'app_translation_data.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys {

    Map<String, String> english = {};
    Map<String, String> bangla = {};

    for (var element in AppTranslationData.data) {
      english[element.key] = element.en;
      bangla[element.key] = element.bn;
    }

    return {
      'en': english,
      'bn': bangla,
    };
  }
}
