import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:proposal_1/src/items/item_controller.dart';
import 'package:proposal_1/src/items/item_details.dart';
import 'package:proposal_1/src/items/item_list.dart';
import 'package:proposal_1/src/settings/app_theme.dart';
import 'package:proposal_1/src/settings/settings_controller.dart';
import 'package:proposal_1/src/settings/settings_view.dart';

class MyApp extends StatelessWidget {
  final SettingsController settingsController;
  final ItemController itemController;

  const MyApp({
    Key key,
    @required this.itemController,
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
          theme: settingsController.theme == AppTheme.light
              ? ThemeData()
              : ThemeData.dark(),
          initialRoute: '/',
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (context) {
                if (routeSettings.name == '/settings') {
                  return SettingsView(controller: settingsController);
                } else if (routeSettings.name.contains('item')) {
                  return ItemDetailsPage(
                    id: int.parse(routeSettings.name.split('/').last),
                    controller: itemController,
                  );
                }

                return ItemList(
                  controller: itemController,
                );
              },
            );
          },
        );
      },
    );
  }
}
