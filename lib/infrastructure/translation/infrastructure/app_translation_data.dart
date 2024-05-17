import '../../../domain/core/constants/app_translation_strings.dart';
import '../domain/entities/app_translated_data.dart';

abstract class AppTranslationData {
  static List<AppTranslatedData> data = [
    const AppTranslatedData(
      key: AppTranslationStrings.appName,
      en: 'Dummy App',
      bn: 'ডামি অ্যাপ',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.translation,
      en: 'Translation',
      bn: 'অনুবাদ',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.language,
      en: 'Language',
      bn: 'ভাষা',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.english,
      en: 'English',
      bn: 'ইংরেজি',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.bangla,
      en: 'Bangla',
      bn: 'বাংলা',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.hour,
      en: 'Hour',
      bn: 'ঘণ্টা',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.minute,
      en: 'Minute',
      bn: 'মিনিট',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.second,
      en: 'Second',
      bn: 'সেকেন্ড',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.people,
      en: 'People',
      bn: 'জন',
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.noTitle,
      bn: "শিরোনাম নেই",
      en: "No Title",
    ),
    const AppTranslatedData(
      key: AppTranslationStrings.continueListening,
      bn: "শুনছিলাম",
      en: "Continue Listening",
    ),
  ];

  static Map<String, Map<int, String>> get numbersMap => {
        "en": {
          0: '0',
          1: '1',
          2: '2',
          3: '3',
          4: '4',
          5: '5',
          6: '6',
          7: '7',
          8: '8',
          9: '9'
        },
        "bn": {
          0: '০',
          1: '১',
          2: '২',
          3: '৩',
          4: '৪',
          5: '৫',
          6: '৬',
          7: '৭',
          8: '৮',
          9: '৯'
        },
      };
}
