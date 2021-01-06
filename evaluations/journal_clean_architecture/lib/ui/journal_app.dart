import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:journal_clean_architecture/domain/entities/app_theme.dart';
import 'package:journal_clean_architecture/ui/navigation/app_route_information_parser.dart';
import 'package:journal_clean_architecture/ui/navigation/app_router_delegate.dart';
import 'package:journal_clean_architecture/ui/user_settings_controller.dart';

class JournalApp extends StatefulWidget {
  final AppRouterDelegate routerDelegate;
  final UserSettingsController controller;

  const JournalApp({
    Key key,
    @required this.routerDelegate,
    @required this.controller,
  }) : super(key: key);

  @override
  _JournalAppState createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  final routeInformationParser = const AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        return MaterialApp.router(
          theme: _buildTheme(widget.controller.theme),
          locale: Locale.fromSubtags(languageCode: widget.controller.locale),
          supportedLocales: [
            Locale.fromSubtags(languageCode: 'en'),
            Locale.fromSubtags(languageCode: 'de'),
          ],
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          routeInformationParser: routeInformationParser,
          routerDelegate: widget.routerDelegate,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }

  ThemeData _buildTheme(AppTheme appTheme) {
    switch (appTheme) {
      case AppTheme.light:
        return ThemeData.light();
      case AppTheme.dark:
      default:
        return ThemeData.dark();
    }
  }
}
