import 'package:proposal_1/src/logging/logging_service.dart';

/// Disable all logging in profile mode which may affect the performance of
/// the application.
class ProfileLoggingService implements LoggingService {
  @override
  void debug(String message) {}

  @override
  void error(Object error, StackTrace stackTrace) {}

  @override
  void info(String message) {}

  @override
  void warning(String message) {}
}
