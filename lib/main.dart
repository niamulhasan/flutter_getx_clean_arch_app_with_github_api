import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimal_rest/minimal_rest.dart';
import 'package:starter_project/di_container.dart';
import 'package:starter_project/infrastructure/themes/domain/repositories/themes_repository.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';
import 'infrastructure/translation/domain/repositories/app_translations_repository.dart';
import 'infrastructure/user_local_settings/domain/repositories/user_local_settings.repository.dart';
import 'infrastructure/utils/dependency_locator_utils/dependency_locator.dart';
import 'infrastructure/utils/dependency_locator_utils/if_found.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DomainLayerDependencyInjectionContainer.init();
  var initialRoute = await Routes.initialRoute;


  MinRest.init("https://api.github.com");

  runApp(
    Main(
      initialRoute,
      DependencyLocator.locate<UserLocalSettingsRepository>(),
      DependencyLocator.locate<ThemesRepository>(),
      DependencyLocator.locate<AppTranslationsRepository>(),
    ),
  );
}

class Main extends StatelessWidget {
  final String initialRoute;
  final UserLocalSettingsRepository? _settingsRepository;
  final ThemesRepository? _themeRepository;
  final AppTranslationsRepository? _appTranslationsRepository;

  const Main(
    this.initialRoute,
    this._settingsRepository,
    this._themeRepository,
    this._appTranslationsRepository, {
    super.key,
  });

  ThemeMode get themeMode {
    return ifFound<ThemeMode>([_settingsRepository, _themeRepository], () {
          return _settingsRepository!.getSettings(SettingName.theme) ==
                  _themeRepository!.darkTheme.name
              ? ThemeMode.dark
              : ThemeMode.light;
        }) ??
        ThemeMode.system;
  }

  Locale? get locale {
    return ifFound([_settingsRepository], () {
      if (_settingsRepository!.getSettings(SettingName.locale) == null) {
        return Get.deviceLocale;
      }
      return Locale(_settingsRepository.getSettings(SettingName.locale)!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      getPages: Nav.routes,
      theme: _themeRepository?.lightTheme.themeData ?? ThemeData.light(),
      darkTheme: _themeRepository?.darkTheme.themeData ?? ThemeData.dark(),
      themeMode: themeMode,
      translations: _appTranslationsRepository?.getTranslations,
      locale: locale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
