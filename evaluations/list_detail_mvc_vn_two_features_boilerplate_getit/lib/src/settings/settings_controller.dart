import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings_repository.dart';

class SettingsController extends ValueNotifier<Settings> {
  SettingsController() : super(Settings());

  Future<void> loadSettings() async {
    value = await GetIt.I<SettingsRepository>().settings();
  }

  Future<void> updateTheme(AppTheme theme) async {
    value = Settings(theme);
    await GetIt.I<SettingsRepository>().updateSettings(value);
  }
}
