import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// This sample uses the shared_preferences package to persist the user's
/// desired settings.
class SettingsService {
  SettingsService(this._sharedPreferences, [this._themeModeKey = '_theme']);

  final SharedPreferences _sharedPreferences;
  final String _themeModeKey;

  /// Persists the user's preferred ThemeMode to local storage
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Convert the ThemeMode to a String which can be stored by
    // shared_preferences. This process is known as serialization.
    final themeModeAsString = theme.toString();

    // Store the String using SharedPreferences
    await _sharedPreferences.setString(_themeModeKey, themeModeAsString);
  }

  /// Loads the User's preferred ThemeMode from local storage
  Future<ThemeMode> themeMode() async {
    // Load the Theme Mode String from Shared Preferences
    final themeModeAsString = _sharedPreferences.getString(_themeModeKey);

    // Convert the stored String back into a proper ThemeMode. This a process is
    // known as deserialization.
    switch (themeModeAsString) {
      case 'ThemeMode.dark':
        return ThemeMode.light;
      case 'ThemeMode.light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}
