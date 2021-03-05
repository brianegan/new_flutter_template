import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:template_tests/src/settings/settings_controller.dart';
import 'package:template_tests/src/settings/settings_service.dart';


void main() {
  // A suite of unit tests that verifies the functionality of the
  // SettingsController.
  group('SettingsController', () {
    test('starts with empty settings', () {
      final controller = SettingsController(MockSettingsService());

      expect(controller.themeMode, isNull);
    });

    test('loads settings from the service and notifies listeners', () async {
      final service = MockSettingsService();
      final controller = SettingsController(service);
      ThemeMode capturedThemeMode;

      // Configure the MockSettingsService to return an expected ThemeMode
      when(service.themeMode()).thenAnswer((_) async => ThemeMode.dark);

      // Listen to the controller for changes
      controller.addListener(() => capturedThemeMode = controller.themeMode);

      // When the controller loads the settings, it should request them from the
      // Service and notify any listeners.
      await controller.loadSettings();

      // Verify the Controller has stored the themeMode in memory
      expect(controller.themeMode, ThemeMode.dark);

      // Verify the Controller has alerted listeners the themeMode has been
      // updated.
      expect(capturedThemeMode, ThemeMode.dark);
    });

    test('updates settings and notifies listeners', () async {
      final service = MockSettingsService();
      final controller = SettingsController(service);
      ThemeMode capturedThemeMode;

      // Listen to the controller for changes
      controller.addListener(() => capturedThemeMode = controller.themeMode);

      // When the controller loads the settings, it should request them from the
      // Service and notify any listeners.
      await controller.updateThemeMode(ThemeMode.light);

      // Verify the Controller has stored the themeMode in memory
      expect(controller.themeMode, ThemeMode.light);

      // Verify the Controller has alerted listeners the themeMode has been
      // updated.
      expect(capturedThemeMode, ThemeMode.light);

      // Use the MockSettingsService to check if the the Controller persisted
      // the new theme using the Service
      verify(service.updateThemeMode(ThemeMode.light));
    });
  });
}

// The SettingsService is normally responsible for loading and persisting data
// on disk or over the network. However, you generally don't want to persist
// test data. Therefore, use "mocks" or "fakes" that do not persist any data as
// a substitute in unit tests.
//
// Learn more about Mocking at
// https://flutter.dev/docs/cookbook/testing/unit/mocking
class MockSettingsService extends Mock implements SettingsService {}
