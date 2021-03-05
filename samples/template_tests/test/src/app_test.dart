import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:template_tests/src/app.dart';
import 'package:template_tests/src/dummy_feature/dummy_item_details_view.dart';
import 'package:template_tests/src/settings/settings_controller.dart';
import 'package:template_tests/src/settings/settings_service.dart';
import 'package:template_tests/src/settings/settings_view.dart';

void main() {
  // A suite of tests that verifies the functionality of a List/Detail App
  group('MyApp', () {
    testWidgets('displays a list of items', (WidgetTester tester) async {
      final service = SettingsService();
      final controller = SettingsController(service);

      await controller.loadSettings();
      await tester.pumpWidget(MyApp(settingsController: controller));

      expect(find.byType(ListTile), findsNWidgets(3));
      await expectLater(find.byType(MyApp), matchesGoldenFile('list.png'));
    });

    testWidgets('navigates to an item page', (WidgetTester tester) async {
      final service = SettingsService();
      final controller = SettingsController(service);

      await controller.loadSettings();
      await tester.pumpWidget(MyApp(settingsController: controller));
      await tester.tap(find.byType(ListTile).first);
      await tester.pumpAndSettle();

      expect(find.byType(DummyItemDetailsView), findsOneWidget);
      await expectLater(find.byType(MyApp), matchesGoldenFile('details.png'));
    });

    testWidgets('changes the app theme', (WidgetTester tester) async {
      final service = SettingsService();
      final controller = SettingsController(service);

      // Navigate to Settings
      await controller.loadSettings();
      await tester.pumpWidget(MyApp(settingsController: controller));
      await tester.tap(find.byType(IconButton));
      await tester.pumpAndSettle();

      // Verify defaults in place
      expect(controller.themeMode, ThemeMode.system);
      expect(find.byType(SettingsView), findsOneWidget);
      await expectLater(find.byType(MyApp), matchesGoldenFile('system.png'));

      // Change to Dark Theme
      await tester.tap(find.text('System Theme'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Dark Theme').last);
      await tester.pumpAndSettle();

      // Verify Dark Theme rendered
      expect(controller.themeMode, ThemeMode.dark);
      await expectLater(find.byType(MyApp), matchesGoldenFile('dark.png'));

      // Change to Light Theme
      await tester.tap(find.text('Dark Theme'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Light Theme').last);
      await tester.pumpAndSettle();

      // Verify light theme enabled
      expect(controller.themeMode, ThemeMode.light);
      expect(find.byWidgetPredicate((widget) => widget is MaterialApp && widget.themeMode == ThemeMode.light), findsOneWidget);
      await expectLater(find.byType(MyApp), matchesGoldenFile('light.png'));
    });
  });
}
