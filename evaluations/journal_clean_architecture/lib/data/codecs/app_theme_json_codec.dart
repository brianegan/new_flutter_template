import 'dart:convert';

import 'package:journal_clean_architecture/domain/entities/app_theme.dart';

class AppThemeCodec extends Codec<AppTheme, String> {
  const AppThemeCodec();

  @override
  Converter<String, AppTheme> get decoder => const _AppThemeJsonDecoder();

  @override
  Converter<AppTheme, String> get encoder => const _AppThemeJsonEncoder();
}

class _AppThemeJsonDecoder extends Converter<String, AppTheme> {
  const _AppThemeJsonDecoder();

  @override
  AppTheme convert(String input) {
    switch (input) {
      case _light:
        return AppTheme.light;
      case _dark:
      default:
        return AppTheme.dark;
    }
  }
}

class _AppThemeJsonEncoder extends Converter<AppTheme, String> {
  const _AppThemeJsonEncoder();

  @override
  String convert(AppTheme input) {
    switch (input) {
      case AppTheme.light:
        return _light;
      case AppTheme.dark:
      default:
        return _dark;
    }
  }
}

const _light = 'light';
const _dark = 'dark';
