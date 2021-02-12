import 'package:proposal_1/src/logging/logging_service.dart';

// Send information to a logging or crash reporting service in release mode.
//
// For example, you may want to log all errors to Sentry or Firebase
// Crashlytics. Then, you can use the logs or crash reports to monitor and
// improve the stability of your app.
class ReleaseLoggingService implements LoggingService {
  @override
  void debug(String message) {
    // TODO: Send Debug Statements to a service
    // sentryClient.captureMessage(message, level: SentryLevel.debug);
  }

  @override
  void error(Object error, StackTrace stackTrace) {
    // TODO: Send Errors to a service like Sentry or Firebase Crashlytics
    // sentryClient.captureException(error, stackTrace: stackTrace);
    // crashlytics.recordError(error, stackTrace);
  }

  @override
  void info(String message) {
    // TODO: Send Info Statements to a service
    // sentryClient.captureMessage(message, level: SentryLevel.info);
  }

  @override
  void warning(String message) {
    // TODO: Send Info Statements to a service
    // sentryClient.captureMessage(message, level: SentryLevel.warning);
  }
}
