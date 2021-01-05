import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';

class JournalEntriesList extends StatelessWidget {
  final List<JournalEntry> entries;

  const JournalEntriesList({Key key, this.entries}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final entry = entries[index];

      return ListTile(
        title: Text(entry.title),
      );
    });
  }
}
