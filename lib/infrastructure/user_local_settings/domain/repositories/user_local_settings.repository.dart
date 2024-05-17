
enum SettingName {theme, locale}

abstract class UserLocalSettingsRepository {
  String? getSettings(SettingName name);
  Future<bool> saveSettings(SettingName name, String value, [String? secondaryValue]);
}