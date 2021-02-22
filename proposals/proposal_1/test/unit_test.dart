// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter_test/flutter_test.dart';

// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction
void main() {
  group('Plus Operator', () {
    test('should add two numbers together', () {
      expect(1 + 1, 2);
    });
  });
}
