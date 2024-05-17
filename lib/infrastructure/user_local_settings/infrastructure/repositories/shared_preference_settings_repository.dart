import '../../../utils/enum_utils.dart';
import '../../domain/repositories/user_local_settings.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceSettingsRepository implements UserLocalSettingsRepository {

  final SharedPreferences _sharedPreferences;

  SharedPreferenceSettingsRepository(this._sharedPreferences);

  @override
  String? getSettings(SettingName name) {
    return _sharedPreferences.getString(EnumUtils.enumToString(name));
  }

  @override
  Future<bool> saveSettings(SettingName name, String value, [String? secondaryValue]) async {
    return await _sharedPreferences.setString(EnumUtils.enumToString(name), value);
  }

}