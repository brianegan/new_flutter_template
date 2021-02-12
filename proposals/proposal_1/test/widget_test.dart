// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyWidget', () {
    testWidgets('should display a string of text', (WidgetTester tester) async {
      // Build MyWidget and trigger a frame.
      await tester.pumpWidget(MyWidget());

      // Verify MyWidget shows some text
      expect(find.byType(Text), findsOneWidget);
    });

    testWidgets('should have a button', (WidgetTester tester) async {
      // Build MyWidget and trigger a frame.
      await tester.pumpWidget(MyWidget());

      // Verify MyWidget shows a button
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Text('Hello'),
        floatingActionButton: FloatingActionButton(onPressed: () {}),
      ),
    );
  }
}
