import 'dart:convert';

import 'package:journal_clean_architecture/domain/entities/app_theme.dart';

class AppThemeJsonCodec extends Codec<AppTheme, String> {
  const AppThemeJsonCodec();

  @override
  Converter<String, AppTheme> get decoder => const _AppThemeJsonDecoder();

  @override
  Converter<AppTheme, String> get encoder => const _AppThemeJsonEncoder();
}

class _AppThemeJsonDecoder extends Converter<String, AppTheme> {
  const _AppThemeJsonDecoder();

  @override
  AppTheme convert(String input) {
    final theme = json.decode(input)["theme"];

    return AppTheme.values.firstWhere((t) => t.toString() == theme);
  }
}

class _AppThemeJsonEncoder extends Converter<AppTheme, String> {
  const _AppThemeJsonEncoder();

  @override
  String convert(AppTheme input) {
    return json.encode({
      "theme": input.toString(),
    });
  }
}
