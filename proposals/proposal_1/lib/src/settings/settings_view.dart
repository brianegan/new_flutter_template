import 'package:flutter/material.dart';
import 'package:proposal_1/src/settings/app_theme.dart';
import 'package:proposal_1/src/settings/settings_controller.dart';

class SettingsView extends StatelessWidget {
  final SettingsController controller;

  const SettingsView({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return DropdownButton<AppTheme>(
              value: controller.theme,
              onChanged: (newTheme) => controller.updateTheme(newTheme),
              items: [
                const DropdownMenuItem(
                  value: AppTheme.light,
                  child: Text('Light Theme'),
                ),
                const DropdownMenuItem(
                  value: AppTheme.dark,
                  child: Text('Dark Theme'),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
