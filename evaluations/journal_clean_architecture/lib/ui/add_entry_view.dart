import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/services/validation_service.dart';
import 'package:journal_clean_architecture/ui/journal_controller.dart';

class AddEntryView extends StatefulWidget {
  final ValidationService validationService;
  final JournalController journalController;
  final VoidCallback onEntryAdded;

  const AddEntryView({
    Key key,
    @required this.validationService,
    @required this.journalController,
    @required this.onEntryAdded,
  }) : super(key: key);

  @override
  _AddEntryViewState createState() => _AddEntryViewState();
}

class _AddEntryViewState extends State<AddEntryView> {
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
                  labelText: 'Title',
                ),
                maxLines: 1,
                validator: (title) {
                  if (widget.validationService.isEmpty(title)) {
                    return 'Title cannot be blank';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _bodyController,
                decoration: InputDecoration(labelText: 'Body'),
                minLines: 1,
                maxLines: 3,
                validator: (title) {
                  if (widget.validationService.isEmpty(title)) {
                    return 'Body cannot be blank';
                  }

                  return null;
                },
              ),
              SizedBox(height: 16),
              RaisedButton(
                onPressed: _submitForm,
                child: Text('Add Entry'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    if (_formKey.currentState.validate()) {
      await widget.journalController.addEntry(JournalEntry(
        title: _titleController.text,
        date: DateTime.now(),
        body: _bodyController.text,
      ));

      widget.onEntryAdded();
    }
  }
}
