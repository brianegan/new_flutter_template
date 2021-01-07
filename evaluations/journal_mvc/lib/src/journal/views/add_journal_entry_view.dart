import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_mvc/src/journal/controllers/journal_controller.dart';
import 'package:journal_mvc/src/journal/models/journal_entry.dart';

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
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).title),
                maxLines: 1,
                validator: (title) {
                  if (!widget.controller.isValidTitle(title)) {
                    return AppLocalizations.of(context).titleValidationError;
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).body),
                minLines: 1,
                maxLines: 3,
                validator: (body) {
                  if (!widget.controller.isValidBody(body)) {
                    return AppLocalizations.of(context).bodyValidationError;
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: _submitForm,
                child: Text(AppLocalizations.of(context).saveEntry),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      await widget.controller.addEntry(JournalEntry(
        title: _titleController.text,
        body: _bodyController.text,
      ));

      widget.onEntryAdded();
    }
  }
}
