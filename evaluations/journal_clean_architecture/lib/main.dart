import 'package:flutter/material.dart';
import 'package:journal_clean_architecture/data/repositories/local_storage_favorites_repository.dart';
import 'package:journal_clean_architecture/data/repositories/local_storage_journal_repository.dart';
import 'package:journal_clean_architecture/data/repositories/local_storage_user_settings_repository.dart';
import 'package:journal_clean_architecture/domain/services/journal_service.dart';
import 'package:journal_clean_architecture/domain/services/user_settings_service.dart';
import 'package:journal_clean_architecture/domain/services/validation_service.dart';
import 'package:journal_clean_architecture/ui/journal_app.dart';
import 'package:journal_clean_architecture/ui/navigation/app_router_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Set up our Repositories
  final preferences = await SharedPreferences.getInstance();
  final journalRepository = LocalStorageJournalRepository(preferences);
  final favoritesRepository = LocalStorageFavoritesRepository(preferences);
  final userSettingsRepository =
      LocalStorageUserSettingsRepository(preferences);

  // Use the Repositories in our Services
  final journalService = JournalService(journalRepository, favoritesRepository);
  final userSettingsService = UserSettingsService(userSettingsRepository);

  runApp(
    JournalApp(
      routerDelegate: AppRouterDelegate(
        journalService: journalService,
        userSettingsService: userSettingsService,
        validationService: ValidationService(),
      ),
    ),
  );
}
