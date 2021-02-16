import 'package:flutter/material.dart';
import 'package:proposal_1/src/settings/settings_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key key, @required this.controller}) : super(key: key);

  static const routeName = '/settings';
  final SettingsController controller;

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
            return DropdownButton<ThemeMode>(
              value: controller.themeMode,
              onChanged: controller.updateThemeMode,
              items: [
                const DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                const DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                const DropdownMenuItem(
                  value: ThemeMode.dark,
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
