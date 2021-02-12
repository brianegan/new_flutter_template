import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proposal_1/src/app.dart';
import 'package:proposal_1/src/items/item_controller.dart';
import 'package:proposal_1/src/items/item_service.dart';
import 'package:proposal_1/src/logging/debug_logging_service.dart';
import 'package:proposal_1/src/logging/profile_logging_service.dart';
import 'package:proposal_1/src/logging/release_logging_service.dart';
import 'package:proposal_1/src/settings/settings_controller.dart';
import 'package:proposal_1/src/settings/settings_service.dart';

void main() {
  // Set up cross-cutting Services, such as Logging, Analytics, or Feature Flags

  // First, set up the correct LoggingService depending on the environment
  final loggingService = kProfileMode
      ? ProfileLoggingService()
      : kReleaseMode
          ? ReleaseLoggingService()
          : DebugLoggingService();

  // Catch Flutter errors and forward them to the logging service.
  FlutterError.onError = (FlutterErrorDetails details) {
    loggingService.error(details.exceptionAsString(), details.stack);
  };

  // Catch Dart errors and forward them to the logging service.
  runZonedGuarded(() async {
    // Setup the Settings Service
    final settingsController = SettingsController(SettingsService());

    // Load the user's settings before displaying the App.
    await settingsController.loadSettings();

    runApp(MyApp(
      itemController: ItemController(ItemService(), loggingService),
      settingsController: settingsController,
    ));
  }, (error, stackTrace) {
    loggingService.error(error, stackTrace);
  });
}
