import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:journal_mvc/src/journal/controllers/journal_controller.dart';
import 'package:journal_mvc/src/journal/views/add_journal_entry_view.dart';
import 'package:journal_mvc/src/journal/views/journal_entry_details_view.dart';
import 'package:journal_mvc/src/journal/views/journal_entry_list_view.dart';
import 'package:journal_mvc/src/user_settings/controllers/user_settings_controller.dart';
import 'package:journal_mvc/src/user_settings/models/app_theme.dart';
import 'package:journal_mvc/src/user_settings/views/user_settings_view.dart';

class JournalApp extends StatelessWidget {
  final JournalController journalController;
  final UserSettingsController userSettingsController;

  const JournalApp({
    Key key,
    @required this.journalController,
    @required this.userSettingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: userSettingsController,
      builder: (context, _) {
        return MaterialApp(
          // Visuals
          theme: _buildTheme(userSettingsController.theme),
          debugShowCheckedModeBanner: false,

          // Routing
          initialRoute: '/',
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return _buildPage(context, Uri.parse(settings.name));
              },
            );
          },

          // Localizations
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          locale: Locale.fromSubtags(
            languageCode: userSettingsController.languageCode,
          ),
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

  // Build the correct page based on the current Uri.
  Widget _buildPage(BuildContext context, Uri uri) {
    switch (uri.pathSegments.length) {
      case 1: // Settings (/settings)
        return UserSettingsView(controller: userSettingsController);
      case 2: // Journal Entry Pages (/entry/add or /entry/123)
        if (uri.pathSegments[1] == 'add') {
          return AddJournalEntryView(
            controller: journalController,
            onEntryAdded: () => Navigator.pop(context),
          );
        }

        return JournalEntryDetailsView(
          id: uri.pathSegments[1],
          controller: journalController,
        );
      case 0: // Home Page (/)
      default:
        return JournalEntryListView(
          controller: journalController,
        );
    }
  }
}
