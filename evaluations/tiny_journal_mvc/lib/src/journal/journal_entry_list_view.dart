import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tiny_journal_mvc/src/journal/error_view.dart';
import 'package:tiny_journal_mvc/src/journal/journal_controller.dart';

class JournalEntryListView extends StatefulWidget {
  final JournalController controller;

  const JournalEntryListView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  _JournalEntryListViewState createState() => _JournalEntryListViewState();
}

class _JournalEntryListViewState extends State<JournalEntryListView> {
  @override
  void initState() {
    // Load the Journal Entries when we first show the List View!
    if (!widget.controller.initialized) {
      widget.controller.loadEntries();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = widget.controller;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
            tooltip: AppLocalizations.of(context).settings,
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, _) {
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.error) {
            return ErrorView(
              message: AppLocalizations.of(context).loadJournalError,
            );
          } else if (controller.entries.isEmpty) {
            return Center(
                child: Text(AppLocalizations.of(context).noJournalEntries));
          }

          return ListView.builder(
            itemCount: controller.entries.length,
            itemBuilder: (context, index) {
              final entry = controller.entries[index];

              return ListTile(
                title: Text(entry.title),
                onTap: () => Navigator.pushNamed(context, '/entry/${entry.id}'),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/entry/add'),
        tooltip: AppLocalizations.of(context).addJournalEntry,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
