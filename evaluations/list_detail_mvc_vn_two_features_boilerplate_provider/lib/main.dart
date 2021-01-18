import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/app.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/settings/settings_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/settings/settings_repository.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/users/user_repository.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final preferences = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<UserController>(
          create: (_) => UserController(UserRepository())..loadUsers(),
          dispose: (_, userController) => userController.dispose(),
        ),
        ListenableProvider<SettingsController>(
          create: (_) => SettingsController(SettingsRepository(preferences))
            ..loadSettings(),
          dispose: (_, settingsController) => settingsController.dispose(),
        ),
      ],
      child: UserListApp(),
    ),
  );
}
