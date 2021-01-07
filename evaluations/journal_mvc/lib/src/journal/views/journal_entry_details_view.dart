import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_mvc/src/journal/controllers/journal_controller.dart';
import 'package:journal_mvc/src/journal/views/error_view.dart';

class JournalEntryDetailsView extends StatefulWidget {
  final String id;
  final JournalController controller;

  const JournalEntryDetailsView({
    Key key,
    @required this.id,
    @required this.controller,
  }) : super(key: key);

  @override
  _JournalEntryDetailsViewState createState() =>
      _JournalEntryDetailsViewState();
}

class _JournalEntryDetailsViewState extends State<JournalEntryDetailsView> {
  @override
  void initState() {
    if (!widget.controller.initialized) {
      widget.controller.loadEntries();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).journalEntry),
      ),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, _) {
          final entry = widget.controller.entry(widget.id);

          if (widget.controller.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (widget.controller.error) {
            return ErrorView(
              message: AppLocalizations.of(context).loadJournalError,
            );
          } else if (widget.controller.entries.isEmpty) {
            return Center(
              child: Text(AppLocalizations.of(context).noJournalEntries),
            );
          }

          return ListView(
            padding: EdgeInsets.all(16),
            children: [
              Text(
                entry.title,
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(height: 16),
              Text(entry.body),
            ],
          );
        },
      ),
    );
  }
}
