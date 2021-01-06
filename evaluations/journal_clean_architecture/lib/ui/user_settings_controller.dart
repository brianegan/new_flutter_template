import 'package:flutter/cupertino.dart';
import 'package:journal_clean_architecture/domain/entities/app_theme.dart';
import 'package:journal_clean_architecture/domain/services/user_settings_service.dart';

class UserSettingsController with ChangeNotifier {
  final UserSettingsService service;

  UserSettingsController(this.service);

  AppTheme _theme;
  String _locale;

  AppTheme get theme => _theme;
  String get locale => _locale ?? 'en';

  Future<void> loadUserSettings() async {
    _theme = await service.theme;
    _locale = await service.locale;
  }

  Future<void> updateTheme(AppTheme newTheme) async {
    _theme = newTheme;
    await service.updateTheme(_theme);
    notifyListeners();
  }

  Future<void> updateLocale(String newLocale) async {
    _locale = newLocale;
    await service.updateLocale(newLocale);
    notifyListeners();
  }
}
