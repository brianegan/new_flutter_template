import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

/// A service that stores and retrieves user settings.
///
/// This sample reads and writes settings to a local file on device. Note: This
/// does not work on Flutter Web.
class SettingsService {
  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode mode) async {
    // Access the file
    final file = await _localFile;

    // Convert the ThemeMode to a String which can be stored by
    // shared_preferences. This process is known as serialization.
    final themeModeAsString = mode.toString();

    // Write the file.
    return file.writeAsString(themeModeAsString);
  }

  /// Loads the User's preferred ThemeMode from local storage
  Future<ThemeMode> themeMode() async {
    try {
      // Access the file
      final file = await _localFile;

      // Load the serialized ThemeMode String from the file
      final themeModeAsString = await file.readAsString();

      // Convert the stored String back into a proper ThemeMode. This a process
      // is known as deserialization.
      switch (themeModeAsString) {
        case 'ThemeMode.dark':
          return ThemeMode.dark;
        case 'ThemeMode.light':
          return ThemeMode.light;
        default:
          return ThemeMode.system;
      }
    } catch (exception) {
      // If the file does not exist or another exception occurs, fall back to
      // the system-defined ThemeMode.
      return ThemeMode.system;
    }
  }

  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();

    return File('${directory.path}/settings.txt');
  }
}
