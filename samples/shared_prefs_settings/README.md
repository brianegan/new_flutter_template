# Shared Preferences Sample 

Demonstrates how to use the
[`shared_preferences`](https://pub.dev/packages/shared_preferences) package to
persist user settings. This sample builds on the 

## Recipe

### 1. Add the `shared_preferences` dependency

Navigate to the `pubspec.yaml` file and add `shared_preferences` to the 
dependencies section.

### 2. Pass the `SharedPreferences` to the `SettingsService`

The `SettingsService` is responsible for storing and retrieving user settings. 
To store and retrieve settings on the user's device, use an instance of the 
`SharedPreferences` class.

Update `main.dart` to pass a `SharedPreferences` instance to the
`SettingsService`.

```dart
final settingsController = SettingsController(SettingsService(
    // Create a Settings Service with an instance of the SharedPreferences class
    await SharedPreferences.getInstance(),
));
```

Update `src/settings/settings_service.dart` to accept the `SharedPreferences` 
instance.

```dart
class SettingsService {
  // Accept the SharedPreferences instance and define a key where we'll store
  // the user's selected ThemeMode
  SettingsService(this._sharedPreferences, [this._themeModeKey = '_theme']);

  final SharedPreferences _sharedPreferences;
  final String _themeModeKey;

  Future<void> updateThemeMode(ThemeMode theme) async {}

  Future<ThemeMode> themeMode() async => ThemeMode.system;
}
```

### 3. Update the `SettingsService` to persist settings locally

Next, persist the settings by modifying the `updateThemeMode` method.

```dart
class SettingsService {
  /// Persists the user's preferred ThemeMode to local storage
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Convert the ThemeMode to a String which can be stored by
    // shared_preferences. This process is known as serialization.
    final themeModeAsString = theme.toString();

    // Store the String using SharedPreferences
    await _sharedPreferences.setString(_themeModeKey, themeModeAsString);
  }
}
```

### 4. Update the `SettingsService` to retrieve locally stored settings

Finally, read the settings by modifying the `themeMode` method.

```dart
class SettingsService {
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
```
