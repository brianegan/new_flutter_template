import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_prefs_settings/src/dummy_feature/dummy_item_details_view.dart';
import 'package:shared_prefs_settings/src/dummy_feature/dummy_item_list_view.dart';
import 'package:shared_prefs_settings/src/settings/settings_controller.dart';
import 'package:shared_prefs_settings/src/settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    Key key,
    @required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, _) {
        return MaterialApp(
          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: [AppLocalizations.delegate],

          // Use AppLocalizations to configure a the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          debugShowCheckedModeBanner: false,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case DummyItemDetailsView.routeName:
                    return const DummyItemDetailsView();
                  case DummyItemListView.routeName:
                  default:
                    return const DummyItemListView();
                }
              },
            );
          },
        );
      },
    );
  }
}