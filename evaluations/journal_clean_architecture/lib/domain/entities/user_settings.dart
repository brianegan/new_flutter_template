import 'package:journal_clean_architecture/domain/entities/app_theme.dart';

class UserSettings {
  final AppTheme theme;
  final String locale;

  UserSettings(this.theme, this.locale);

  @override
  String toString() {
    return 'UserSettings{theme: $theme, locale: $locale}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserSettings &&
          runtimeType == other.runtimeType &&
          theme == other.theme &&
          locale == other.locale;

  @override
  int get hashCode => theme.hashCode ^ locale.hashCode;
}
