import 'package:list_detail_mvc_vn_two_features_boilerplate/src/settings/settings.dart';

class SettingsRepository {
  Future<Settings> settings() async => Settings();

  Future<void> updateSettings(Settings s) async {}
}
