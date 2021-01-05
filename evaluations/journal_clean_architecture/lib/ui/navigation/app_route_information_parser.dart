import 'package:flutter/cupertino.dart';
import 'package:journal_clean_architecture/ui/navigation/app_route_configuration.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppRouteConfiguration> {
  const AppRouteInformationParser();

  @override
  Future<AppRouteConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = Uri.parse(routeInformation.location);

    if (uri.pathSegments.isEmpty) {
      return HomeConfiguration();
    } else if (uri.pathSegments.length == 1) {
      switch (uri.pathSegments.first) {
        case "settings":
          return UserSettingsConfiguration();
        default:
          return UnknownConfiguration();
      }
    } else if (uri.pathSegments.length == 2) {
      switch (uri.pathSegments.first) {
        case "entry":
          if (uri.pathSegments[1] == "add") {
            return AddEntryConfiguration();
          }

          return JournalEntryConfiguration(uri.pathSegments[1]);
        default:
          return UnknownConfiguration();
      }
    } else {
      return UnknownConfiguration();
    }
  }

  @override
  RouteInformation restoreRouteInformation(
    AppRouteConfiguration configuration,
  ) {
    return RouteInformation(location: configuration.location);
  }
}
