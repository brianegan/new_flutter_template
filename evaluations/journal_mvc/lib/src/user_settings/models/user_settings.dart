import 'package:journal_mvc/src/user_settings/models/app_theme.dart';

class UserSettings {
  final String languageCode;
  final AppTheme theme;

  UserSettings({
    this.languageCode = 'en',
    this.theme = AppTheme.dark,
  });

  UserSettings.fromJson(Map<String, dynamic> json)
      : languageCode = json['languageCode'] ?? 'en',
        theme = json['theme'] == 'light' ? AppTheme.light : AppTheme.dark;

  Map<String, dynamic> toJson() {
    return {
      'languageCode': languageCode,
      'theme': theme == AppTheme.light ? 'light' : 'dark'
    };
  }

  @override
  String toString() {
    return 'UserSettings{languageCode: $languageCode, theme: $theme}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSettings &&
          runtimeType == other.runtimeType &&
          languageCode == other.languageCode &&
          theme == other.theme;

  @override
  int get hashCode => languageCode.hashCode ^ theme.hashCode;
}
