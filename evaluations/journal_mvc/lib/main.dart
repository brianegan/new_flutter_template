import 'package:flutter/material.dart';
import 'package:journal_mvc/src/app.dart';
import 'package:journal_mvc/src/journal/controllers/journal_controller.dart';
import 'package:journal_mvc/src/journal/repositories/journal_repository.dart';
import 'package:journal_mvc/src/user_settings/controllers/user_settings_controller.dart';
import 'package:journal_mvc/src/user_settings/repositories/user_settings_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Set up the Repositories, which are responsible for storing and retrieving
  // data.
  final preferences = await SharedPreferences.getInstance();
  final journalRepository = JournalRepository(preferences);
  final userSettingsRepository = UserSettingsRepository(preferences);

  // Finally, use the Services to Setup our Controllers! Controllers glue
  // Repositories to Widgets.
  final journalController = JournalController(journalRepository);
  final userSettingsController = UserSettingsController(userSettingsRepository);

  // Sometimes, you may need to load some data before showing the app. In this
  // case, load the correct theme and language.
  await userSettingsController.loadUserSettings();

  runApp(
    JournalApp(
      journalController: journalController,
      userSettingsController: userSettingsController,
    ),
  );
}
