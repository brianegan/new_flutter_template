import 'package:flutter/cupertino.dart';
import 'package:proposal_1/src/settings/app_theme.dart';
import 'package:proposal_1/src/settings/settings_service.dart';

// A class that many Widgets can interact with to read settings, update
// settings, or listen to settings changes.
class SettingsController with ChangeNotifier {
  final SettingsService _settingsService;

  SettingsController(this._settingsService);

  AppTheme _theme;

  AppTheme get theme => _theme;

  Future<void> loadSettings() async {
    _theme = await _settingsService.theme();
    notifyListeners();
  }

  Future<void> updateTheme(AppTheme theme) async {
    _theme = theme;
    notifyListeners();
    await _settingsService.updateTheme(theme);
  }
}
