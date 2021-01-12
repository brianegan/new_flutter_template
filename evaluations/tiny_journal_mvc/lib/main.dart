import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiny_journal_mvc/src/app.dart';
import 'package:tiny_journal_mvc/src/journal/controllers/journal_controller.dart';
import 'package:tiny_journal_mvc/src/journal/repositories/journal_repository.dart';

void main() async {
  // Set up the Repositories, which are responsible for storing and retrieving
  // data.
  final preferences = await SharedPreferences.getInstance();
  final journalRepository = JournalRepository(preferences);

  // Finally, use the Services to Setup our Controllers! Controllers glue
  // Repositories to Widgets.
  final journalController = JournalController(journalRepository);

  runApp(
    JournalApp(
      journalController: journalController,
    ),
  );
}
