import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_clean_architecture/ui/error_view.dart';
import 'package:journal_clean_architecture/ui/journal_controller.dart';

class Dashboard extends StatefulWidget {
  final VoidCallback onAddEntryTap;
  final VoidCallback onSettingsTap;
  final void Function(String id) onEntryTap;
  final JournalController journalController;

  Dashboard({
    Key key,
    @required this.onAddEntryTap,
    @required this.onSettingsTap,
    @required this.onEntryTap,
    @required this.journalController,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // Load the Journal Entries when we first show the Dashboard!
    widget.journalController.loadEntries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: widget.onSettingsTap,
            tooltip: AppLocalizations.of(context).settings,
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: widget.journalController,
        builder: (context, _) {
          final snapshot = widget.journalController.entries;

          if (snapshot.hasData) {
            if (snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final entry = snapshot.data[index];

                  return ListTile(
                    title: Text(entry.title),
                    onTap: () => widget.onEntryTap(entry.id),
                  );
                },
              );
            } else {
              return Center(
                  child: Text(AppLocalizations.of(context).noJournalEntries));
            }
          } else if (snapshot.hasError) {
            return ErrorView(
              message: AppLocalizations.of(context).loadJournalError,
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onAddEntryTap,
        tooltip: AppLocalizations.of(context).addJournalEntry,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
