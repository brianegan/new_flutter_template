import 'package:journal_clean_architecture/domain/entities/app_theme.dart';

abstract class UserSettingsRepository {
  Future<AppTheme> theme();
  Future<void> updateTheme(AppTheme theme);
  Future<String> locale();
  Future<void> updateLocale(String locale);
}
