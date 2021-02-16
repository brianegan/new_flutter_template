import 'package:flutter/material.dart';

// A service that stores and retrieves user settings.
//
// By default, this class does not persist user settings. If you'd like to
// persist the user settings locally, use the shared_preferences package. If
// you'd like to store settings on a web server, use the http package.
class SettingsService {
  Future<ThemeMode> theme() async => ThemeMode.system;

  Future<void> updateTheme(ThemeMode theme) async {}
}
