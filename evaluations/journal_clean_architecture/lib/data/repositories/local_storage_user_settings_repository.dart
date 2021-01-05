import 'package:journal_clean_architecture/data/codecs/app_theme_json_codec.dart';
import 'package:journal_clean_architecture/domain/entities/app_theme.dart';
import 'package:journal_clean_architecture/domain/repositories/user_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUserSettingsRepository implements UserSettingsRepository {
  final SharedPreferences preferences;
  final AppThemeJsonCodec appThemeCodec;
  final String themeKey;
  final String localeKey;

  LocalStorageUserSettingsRepository(this.preferences, {
    this.appThemeCodec = const AppThemeJsonCodec(),
    this.themeKey = '__appThemeStorageKey',
    this.localeKey = '__localeKey',
  });

  @override
  Future<AppTheme> theme() async =>
      appThemeCodec.decode(preferences.getString(themeKey));

  @override
  Future<void> updateTheme(AppTheme theme) =>
      preferences.setString(themeKey, appThemeCodec.encode(theme));

  @override
  Future<String> locale() async => preferences.getString(localeKey);

  @override
  Future<void> updateLocale(String locale) =>
      preferences.setString(localeKey, locale);
}
