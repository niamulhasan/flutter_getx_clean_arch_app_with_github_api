import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starter_project/domain/repositories/repository_info.repository.dart';
import 'package:starter_project/infrastructure/data/repositories/github_repository_info.repositoryImpl.dart';
import 'package:starter_project/infrastructure/themes/domain/repositories/themes_repository.dart';
import 'package:starter_project/infrastructure/themes/infrastructure/repositories/app_default_themes.repository.dart';
import 'package:starter_project/infrastructure/translation/domain/repositories/app_translations_repository.dart';
import 'package:starter_project/infrastructure/translation/infrastructure/repositories/bangla_english_translation_repository.dart';
import 'package:starter_project/infrastructure/user_local_settings/domain/repositories/user_local_settings.repository.dart';
import 'package:starter_project/infrastructure/user_local_settings/infrastructure/repositories/shared_preference_settings_repository.dart';

class DomainLayerDependencyInjectionContainer {
  static Future<void> init() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    //region Repositories DI
    Get.lazyPut<UserLocalSettingsRepository>(
      () => SharedPreferenceSettingsRepository(sharedPreferences),
      fenix: true,
    );

    Get.lazyPut<ThemesRepository>(
      () => AppDefaultThemesRepository(),
      fenix: true,
    );

    Get.lazyPut<AppTranslationsRepository>(
      () => BanglaEnglishTranslationRepository(),
      fenix: true,
    );

    Get.lazyPut<RepositoryInfoRepository>(
      () => GithubRepositoryInfoRepositoryImpl(),
      fenix: true, // fenix: true means singleton so that it will be created only once and will be reused accross the app
    );
    //endregion
  }
}
