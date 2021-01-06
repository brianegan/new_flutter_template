import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_clean_architecture/domain/entities/app_theme.dart';
import 'package:journal_clean_architecture/ui/user_settings_controller.dart';

class UserSettingsView extends StatelessWidget {
  final UserSettingsController controller;

  const UserSettingsView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            AppLocalizations.of(context).theme,
            style: Theme.of(context).textTheme.caption,
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return DropdownButton(
                value: controller.theme,
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
          SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).language,
            style: Theme.of(context).textTheme.caption,
          ),
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return DropdownButton<String>(
                value: controller.locale,
                onChanged: (newLocale) => controller.updateLocale(newLocale),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(AppLocalizations.of(context).english),
                  ),
                  DropdownMenuItem(
                    value: 'de',
                    child: Text(AppLocalizations.of(context).german),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
