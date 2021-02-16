import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item_details_view.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item_list_view.dart';
import 'package:proposal_1/src/settings/settings_controller.dart';
import 'package:proposal_1/src/settings/settings_view.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  const MyApp({
    Key key,
    @required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Listen to the SettingsController for changes to the App Theme. Rebuild
    // the App whenever the theme changes
    return AnimatedBuilder(
      animation: settingsController,
      builder: (context, _) {
        return MaterialApp(
          localizationsDelegates: [AppLocalizations.delegate],
          onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case DummyItemDetailsView.routeName:
                    return DummyItemDetailsView();
                  case DummyItemListView.routeName:
                  default:
                    return DummyItemListView(
                      items: const [DummyItem(1), DummyItem(2), DummyItem(3)],
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
