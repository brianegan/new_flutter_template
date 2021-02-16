import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proposal_1/src/settings/settings_service.dart';

// A class that many Widgets can interact with to read user settings, update
// user settings, or listen to user settings changes.
//
// Controllers glue Data Services to Flutter Widgets.
class SettingsController with ChangeNotifier {
  final SettingsService _settingsService;

  SettingsController(this._settingsService);

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.theme();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode newTheme) async {
    _themeMode = newTheme;
    notifyListeners();
    await _settingsService.updateTheme(newTheme);
  }
}
