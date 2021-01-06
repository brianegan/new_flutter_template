import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:journal_clean_architecture/domain/services/validation_service.dart';
import 'package:journal_clean_architecture/ui/add_entry_view.dart';
import 'package:journal_clean_architecture/ui/dashboard.dart';
import 'package:journal_clean_architecture/ui/journal_controller.dart';
import 'package:journal_clean_architecture/ui/journal_entry_view.dart';
import 'package:journal_clean_architecture/ui/navigation/app_route_configuration.dart';
import 'package:journal_clean_architecture/ui/unknown_route_view.dart';
import 'package:journal_clean_architecture/ui/user_settings_controller.dart';
import 'package:journal_clean_architecture/ui/user_settings_view.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<AppRouteConfiguration> {
  final GlobalKey<NavigatorState> _navigatorKey;
  final JournalController journalController;
  final UserSettingsController userSettingsController;
  final ValidationService validationService;
  AppRouteConfiguration _currentConfiguration;

  AppRouterDelegate({
    GlobalKey<NavigatorState> key,
    @required this.journalController,
    @required this.userSettingsController,
    @required this.validationService,
  }) : _navigatorKey = key ?? GlobalKey<NavigatorState>();

  @override
  AppRouteConfiguration get currentConfiguration =>
      _currentConfiguration ?? HomeConfiguration();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Dashboard(
            onEntryTap: handleJournalEntryTap,
            onAddEntryTap: handleAddEntryTap,
            onSettingsTap: handleSettingsTap,
            journalController: journalController,
          ),
        ),
        if (currentConfiguration is AddEntryConfiguration)
          MaterialPage(
            child: AddEntryView(
              journalController: journalController,
              validationService: validationService,
              onEntryAdded: _navigateHome,
            ),
          ),
        if (currentConfiguration is JournalEntryConfiguration)
          MaterialPage(
            child: JournalEntryView(
              id: (currentConfiguration as JournalEntryConfiguration).id,
              journalController: journalController,
            ),
          ),
        if (currentConfiguration is UnknownConfiguration)
          MaterialPage(child: UnknownRouteView()),
        if (currentConfiguration is UserSettingsConfiguration)
          MaterialPage(
            child: UserSettingsView(
              controller: userSettingsController,
            ),
          ),
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
