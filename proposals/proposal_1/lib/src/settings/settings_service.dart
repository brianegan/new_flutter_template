import 'package:proposal_1/src/settings/app_theme.dart';

// A service that stores and retrieves user settings.
//
// By default, this class does not persist user settings. If you'd like to
// persist the user settings locally, use the shared_preferences package to
// update the methods below. If you'd like to store settings on a web
// server, use the http package.
class SettingsService {
  Future<AppTheme> theme() async => AppTheme.dark;

  Future<void> updateTheme(AppTheme s) async {}
}
