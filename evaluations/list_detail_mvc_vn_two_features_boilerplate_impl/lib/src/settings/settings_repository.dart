import 'dart:convert';

import 'package:list_detail_mvc_vn_two_features_boilerplate_impl/src/settings/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsRepository {
  final SharedPreferences preferences;
  final String storageKey;

  SettingsRepository(
    this.preferences, {
    this.storageKey = '__userSettingsStorageKey',
  });

  Future<Settings> settings() async {
    return Settings.fromJson(
      json.decode(preferences.getString(storageKey) ?? '{}'),
    );
  }

  Future<void> updateSettings(Settings settings) =>
      preferences.setString(storageKey, json.encode(settings.toJson()));
}
