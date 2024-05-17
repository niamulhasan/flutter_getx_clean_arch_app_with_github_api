import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../domain/core/constants/app_translation_strings.dart';
import '../../../infrastructure/user_local_settings/domain/repositories/user_local_settings.repository.dart';
import '../../../infrastructure/utils/dependency_locator_utils/if_found.dart';

class LanguageSwitchButton extends StatelessWidget {
  final UserLocalSettingsRepository? _settingsRepository;

  const LanguageSwitchButton(this._settingsRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Text(
          Get.locale == const Locale('en')
              ? 'EN'
              : Get.locale == const Locale('bn')
              ? 'BN'
              : 'EN',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontSize: 14.0, fontWeight: FontWeight.w700)),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'en',
          child: Text(AppTranslationStrings.english.tr,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
        PopupMenuItem(
          value: 'bn',
          child: Text(AppTranslationStrings.bangla.tr,
              style: Theme.of(context).textTheme.bodyLarge),
        ),
      ],
      onSelected: (String? value) async {
        if (value != null) {
          Get.updateLocale(Locale(value));
          bool isLocaleSaved =
              await ifFound<Future<bool>>([_settingsRepository], () async {
                return await _settingsRepository!
                    .saveSettings(SettingName.locale, value);
              }) ??
                  false;

          if (isLocaleSaved) {
            // AppSnackbar.showSnackbar(AppTranslationKeys.localeChangedTo.tr);
            print("Locale changed to: $value");
          }
        }
      },
    );
  }
}