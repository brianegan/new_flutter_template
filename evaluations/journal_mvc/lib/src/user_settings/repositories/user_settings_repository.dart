import 'dart:convert';

import 'package:journal_mvc/src/user_settings/models/user_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsRepository {
  final SharedPreferences preferences;
  final String storageKey;

  UserSettingsRepository(
    this.preferences, {
    this.storageKey = '__userSettingsStorageKey',
  });

  Future<void> updateSettings(UserSettings settings) =>
      preferences.setString(storageKey, json.encode(settings.toJson()));

  Future<UserSettings> loadSettings() async {
    return UserSettings.fromJson(
      json.decode(preferences.getString(storageKey) ?? '{}'),
    );
  }
}
