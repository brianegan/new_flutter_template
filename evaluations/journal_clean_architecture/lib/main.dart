import 'package:flutter/material.dart';
import 'package:journal_clean_architecture/data/repositories/local_storage_journal_repository.dart';
import 'package:journal_clean_architecture/data/repositories/local_storage_user_settings_repository.dart';
import 'package:journal_clean_architecture/domain/services/journal_service.dart';
import 'package:journal_clean_architecture/domain/services/user_settings_service.dart';
import 'package:journal_clean_architecture/domain/services/validation_service.dart';
import 'package:journal_clean_architecture/ui/journal_app.dart';
import 'package:journal_clean_architecture/ui/journal_controller.dart';
import 'package:journal_clean_architecture/ui/navigation/app_router_delegate.dart';
import 'package:journal_clean_architecture/ui/user_settings_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Set up the Repositories, which are responsible for storing data in the
  // correct way! It could be in-memory, on-disk, or over the network.
  final preferences = await SharedPreferences.getInstance();
  final journalRepository = LocalStorageJournalRepository(preferences);
  final userSettingsRepository =
      LocalStorageUserSettingsRepository(preferences);

  // Set up the Services, which make use of repositories to perform business
  // logic.
  final journalService = JournalService(journalRepository);
  final userSettingsService = UserSettingsService(userSettingsRepository);

  // Finally, use the Services to Setup our Controllers! Controllers bind our
  // Services to our Widgets.
  final journalController = JournalController(journalService);
  final userSettingsController = UserSettingsController(userSettingsService);

  // Sometimes, you may need to load some data before showing the app. In this
  // case, load the stored theme before displaying the app.
  await userSettingsController.loadUserSettings();

  runApp(
    JournalApp(
      controller: userSettingsController,
      routerDelegate: AppRouterDelegate(
        journalController: journalController,
        userSettingsController: userSettingsController,
        validationService: ValidationService(),
      ),
    ),
  );
}
