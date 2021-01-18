import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/settings/settings.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/settings/settings_controller.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SettingsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: DropdownButton(
          value: controller.value.theme,
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
        ),
      ),
    );
  }
}
