
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/internacionalization.dart';

import '../../domain/repositories/app_translations_repository.dart';
import '../app_translation.dart';

class BanglaEnglishTranslationRepository implements AppTranslationsRepository {

  @override
  Translations get getTranslations => AppTranslations();
}