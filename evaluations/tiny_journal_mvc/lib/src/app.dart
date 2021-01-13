import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tiny_journal_mvc/src/journal/add_journal_entry_view.dart';
import 'package:tiny_journal_mvc/src/journal/journal_controller.dart';
import 'package:tiny_journal_mvc/src/journal/journal_entry_details_view.dart';
import 'package:tiny_journal_mvc/src/journal/journal_entry_list_view.dart';

class JournalApp extends StatelessWidget {
  final JournalController journalController;

  const JournalApp({
    Key key,
    @required this.journalController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Visuals
      theme: ThemeData.dark(),
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
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  // Build the correct page based on the current Uri.
  Widget _buildPage(BuildContext context, Uri uri) {
    switch (uri.pathSegments.length) {
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
