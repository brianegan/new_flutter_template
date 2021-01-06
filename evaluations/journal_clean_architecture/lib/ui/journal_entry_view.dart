import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_clean_architecture/ui/error_view.dart';
import 'package:journal_clean_architecture/ui/journal_controller.dart';

class JournalEntryView extends StatelessWidget {
  final String id;
  final JournalController journalController;

  const JournalEntryView({
    Key key,
    @required this.id,
    @required this.journalController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).journalEntry)),
      body: AnimatedBuilder(
        animation: journalController,
        builder: (context, _) {
          final snapshot = journalController.entry(id);

          if (snapshot.hasData) {
            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                Text(
                  snapshot.data.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                SizedBox(height: 16),
                Text(snapshot.data.body),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorView(
                message: AppLocalizations.of(context).loadEntryError,
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
