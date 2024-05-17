

import 'package:get/get.dart';
import 'package:starter_project/infrastructure/translation/infrastructure/extensions/local_number_extension.dart';

import '../../../../domain/core/constants/app_translation_strings.dart';

extension DurationExtention on Duration {

  String get toReadableTranslatedString {
    final hours = inHours;
    final minutes = inMinutes.remainder(60);
    if (hours == 0) return "${minutes.tr} ${AppTranslationStrings.minute.tr}";
    return "${hours.tr} ${AppTranslationStrings.hour.tr} ${minutes.tr} ${AppTranslationStrings.minute.tr}";
  }
}