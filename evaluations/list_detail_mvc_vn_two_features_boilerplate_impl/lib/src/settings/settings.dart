class Settings {
  final AppTheme theme;

  Settings([this.theme = AppTheme.dark]);

  Settings.fromJson(Map<String, dynamic> json)
      : theme = json['theme'] == 'light' ? AppTheme.light : AppTheme.dark;

  Map<String, dynamic> toJson() {
    return {
      'theme': theme == AppTheme.light ? 'light' : 'dark',
    };
  }
}

enum AppTheme { light, dark }
