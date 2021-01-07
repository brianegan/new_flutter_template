import 'package:flutter/widgets.dart';
import 'package:journal_mvc/src/user_settings/models/app_theme.dart';
import 'package:journal_mvc/src/user_settings/models/user_settings.dart';
import 'package:journal_mvc/src/user_settings/repositories/user_settings_repository.dart';

class UserSettingsController with ChangeNotifier {
  final UserSettingsRepository repository;

  UserSettingsController(this.repository);

  UserSettings _settings;

  bool get initialized => _settings != null;
  AppTheme get theme => _settings.theme;
  String get languageCode => _settings.languageCode;

  Future<void> loadUserSettings() async {
    _settings = await repository.loadSettings();
  }

  Future<void> updateTheme(AppTheme newTheme) async {
    _settings = UserSettings(
      theme: newTheme,
      languageCode: _settings.languageCode,
    );

    await repository.updateSettings(_settings);

    notifyListeners();
  }

  Future<void> updateLanguageCode(String newLanguageCode) async {
    _settings = UserSettings(
      theme: _settings.theme,
      languageCode: newLanguageCode,
    );

    await repository.updateSettings(_settings);

    notifyListeners();
  }
}
