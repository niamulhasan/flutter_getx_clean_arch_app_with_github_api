
import 'package:starter_project/infrastructure/translation/infrastructure/extensions/local_number_extension.dart';

extension TranslationExtention on String {
  String get replaceAllNumbersWithTranslation {
    return replaceAllMapped(RegExp(r'[0-9]'), (match) {
      return int.parse(match.group(0)!).tr;
    });
  }
}