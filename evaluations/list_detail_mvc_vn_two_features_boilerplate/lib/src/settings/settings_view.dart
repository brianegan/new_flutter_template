import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate/src/settings/settings.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate/src/settings/settings_controller.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller;

  const SettingsView({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder<Settings>(
          valueListenable: controller,
          builder: (context, settings, _) {
            return DropdownButton(
              value: settings.theme,
              onChanged: (newTheme) => controller.updateTheme(newTheme),
              items: [
                DropdownMenuItem(
                  value: AppTheme.light,
                  child: Text(AppLocalizations.of(context).lightTheme),
                ),
                DropdownMenuItem(
                  value: AppTheme.dark,
                  child: Text(AppLocalizations.of(context).darkTheme),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
