import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:journal_clean_architecture/domain/services/journal_service.dart';
import 'package:journal_clean_architecture/domain/services/user_settings_service.dart';
import 'package:journal_clean_architecture/domain/services/validation_service.dart';
import 'package:journal_clean_architecture/ui/add_entry_view.dart';
import 'package:journal_clean_architecture/ui/dashboard.dart';
import 'package:journal_clean_architecture/ui/journal_entry_view.dart';
import 'package:journal_clean_architecture/ui/navigation/app_route_configuration.dart';
import 'package:journal_clean_architecture/ui/unknown_route_view.dart';
import 'package:journal_clean_architecture/ui/user_settings_view.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AppRouteConfiguration> {
  final GlobalKey<NavigatorState> navigatorKey;
  final JournalService journalService;
  final UserSettingsService userSettingsService;
  final ValidationService validationService;
  AppRouteConfiguration _currentConfiguration;

  AppRouterDelegate({
    GlobalKey<NavigatorState> key,
    @required this.journalService,
    @required this.userSettingsService,
    @required this.validationService,
  }) : navigatorKey = key ?? GlobalKey<NavigatorState>();

  @override
  AppRouteConfiguration get currentConfiguration =>
      _currentConfiguration ?? HomeConfiguration();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Dashboard(
            onEntryTap: handleJournalEntryTap,
            onAddEntryTap: handleAddEntryTap,
            onSettingsTap: handleSettingsTap,
            journalService: journalService,
          ),
        ),
        if (currentConfiguration is AddEntryConfiguration)
          MaterialPage(
            child: AddEntryView(
              journalService: journalService,
              validationService: validationService,
              onEntryAdded: _navigateHome,
            ),
          ),
        if (currentConfiguration is JournalEntryConfiguration)
          MaterialPage(
            child: JournalEntryView(
              id: (currentConfiguration as JournalEntryConfiguration).id,
              journalService: journalService,
            ),
          ),
        if (currentConfiguration is UnknownConfiguration)
          MaterialPage(child: UnknownRouteView()),
        if (currentConfiguration is UserSettingsConfiguration)
          MaterialPage(child: UserSettingsView()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _navigateHome();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRouteConfiguration configuration) {
    _currentConfiguration = configuration;

    return SynchronousFuture(false);
  }

  void handleJournalEntryTap(String id) {
    _currentConfiguration = JournalEntryConfiguration(id);
    notifyListeners();
  }

  void handleAddEntryTap() {
    _currentConfiguration = AddEntryConfiguration();
    notifyListeners();
  }

  void handleSettingsTap() {
    _currentConfiguration = UserSettingsConfiguration();
    notifyListeners();
  }

  void _navigateHome() {
    _currentConfiguration = HomeConfiguration();
    notifyListeners();
  }
}
