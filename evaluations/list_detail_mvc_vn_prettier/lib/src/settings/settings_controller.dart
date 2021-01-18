import 'package:flutter/cupertino.dart';
import 'package:list_detail_mvc_vn_prettier/src/settings/settings.dart';
import 'package:list_detail_mvc_vn_prettier/src/settings/settings_repository.dart';

class SettingsController extends ValueNotifier<Settings> {
  final SettingsRepository repository;

  SettingsController(this.repository) : super(Settings());

  Future<void> loadSettings() async {
    value = await repository.settings();
  }

  Future<void> updateTheme(AppTheme theme) async {
    value = Settings(theme);
    await repository.updateSettings(value);
  }
}
