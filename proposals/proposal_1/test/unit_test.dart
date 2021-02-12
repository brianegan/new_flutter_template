// This is an example unit test.
//
// Unit tests are handy for verifying the behavior of a single function, method,
// or class. This file demonstrates how to test an example Controller class.
//
// Visit https://flutter.dev/docs/cookbook/testing/unit/introduction for
// more information about Unit testing.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyController', () {
    testWidgets('should start at 0', (WidgetTester tester) async {
      // Arrange
      final myController = MyController();

      // Assert
      expect(myController.count, 0);
    });

    testWidgets('should increment by 1', (WidgetTester tester) async {
      // Arrange
      final myController = MyController();

      // Act
      myController.increment();

      // Assert
      expect(myController.count, 1);
    });
  });
}

class MyController with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}
