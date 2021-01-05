import 'package:flutter/material.dart';
import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/services/journal_service.dart';
import 'package:journal_clean_architecture/ui/error_view.dart';

class JournalEntryView extends StatefulWidget {
  final String id;
  final JournalService journalService;

  const JournalEntryView({
    Key key,
    @required this.id,
    @required this.journalService,
  }) : super(key: key);

  @override
  _JournalEntryViewState createState() => _JournalEntryViewState();
}

class _JournalEntryViewState extends State<JournalEntryView> {
  Future<JournalEntry> _entry;

  @override
  void initState() {
    _entry = widget.journalService.entry(widget.id);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant JournalEntryView oldWidget) {
    if (widget.id != oldWidget.id) {
      _entry = widget.journalService.entry(widget.id);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Journal Entry")),
      body: FutureBuilder<JournalEntry>(
        future: _entry,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
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
            return ErrorView(
              message: "Oh no! There was an error loading the journal entry :(",
            );
          }

          return CircularProgressIndicator();
        },
      ),
    );
  }
}
