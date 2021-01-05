class AppRouteConfiguration {
  final String location;

  AppRouteConfiguration(this.location);

  bool get isHome => this is HomeConfiguration;

  bool get isJournalEntry => this is JournalEntryConfiguration;

  bool get isUserSettings => this is UserSettingsConfiguration;

  bool get isUnknown => this is UnknownConfiguration;
}

class HomeConfiguration extends AppRouteConfiguration {
  HomeConfiguration() : super("/");
}

class AddEntryConfiguration extends AppRouteConfiguration {
  AddEntryConfiguration() : super("/entry/add");
}

class JournalEntryConfiguration extends AppRouteConfiguration {
  final String id;

  JournalEntryConfiguration(this.id) : super("/entry/$id");
}

class UserSettingsConfiguration extends AppRouteConfiguration {
  UserSettingsConfiguration() : super("/settings");
}

class UnknownConfiguration extends AppRouteConfiguration {
  UnknownConfiguration() : super("/404");
}
