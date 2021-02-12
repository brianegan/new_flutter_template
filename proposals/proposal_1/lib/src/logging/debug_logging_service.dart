import 'package:flutter/foundation.dart';
import 'package:proposal_1/src/logging/logging_service.dart';

/// Print messages to the console in debug mode.
///
/// This allows you to see and respond to logs while working on your app!
class DebugLoggingService implements LoggingService {
  @override
  void debug(String message) => debugPrint(message);

  @override
  void error(Object error, StackTrace stackTrace) =>
      debugPrint('$error\n\n$stackTrace');

  @override
  void info(String message) => debugPrint(message);

  @override
  void warning(String message) => debugPrint(message);
}
