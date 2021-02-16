import 'package:proposal_1/src/logging/logging_service.dart';

/// By default, disable all logging in profile mode.
///
/// Printing to the console may hinder performance, so it is disabled by
/// default.
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
