import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tiny_journal_mvc/src/journal/journal_controller.dart';
import 'package:tiny_journal_mvc/src/journal/journal_entry.dart';

class AddJournalEntryView extends StatefulWidget {
  final JournalController controller;
  final VoidCallback onEntryAdded;

  const AddJournalEntryView({
    Key key,
    @required this.controller,
    @required this.onEntryAdded,
  }) : super(key: key);

  @override
  _AddJournalEntryViewState createState() => _AddJournalEntryViewState();
}

class _AddJournalEntryViewState extends State<AddJournalEntryView> {
  final _titleController = TextEditingController();
  final _bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).addJournalEntry),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).title,
              ),
            ),
            TextFormField(
              controller: _bodyController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).body,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(AppLocalizations.of(context).saveEntry),
            )
          ],
        ),
      ),
    );
  }

  void _submitForm() async {
    await widget.controller.addEntry(JournalEntry(
      title: _titleController.text,
      body: _bodyController.text,
    ));

    widget.onEntryAdded();
  }
}
