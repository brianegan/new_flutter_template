/// A Service that records application messages or exceptions.
///
/// There are three implementations of this abstract class:
///   - Release version: Sends records to a logging or error capturing service,
///     such as Firebase Crashlytics or Sentry. Modify this file to change where
///     logs are sent in release builds.
///   - Debug version: Prints information to the console as you work. You
///     should only modify this file if you want to change how to print messages
///     during development.
///   - Profile version: Does nothing. Printing or sending logs to a service may
///     cause unwanted jank during a performance profile. You should only change
///     this file if you want to modify how logs are handled during performance
///     profiles.
abstract class LoggingService {
  void debug(String message);

  void error(Object error, StackTrace stackTrace);

  void info(String message);

  void warning(String message);
}
