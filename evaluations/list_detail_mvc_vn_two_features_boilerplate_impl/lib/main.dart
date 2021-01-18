import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_impl/src/app.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_impl/src/settings/settings_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_impl/src/settings/settings_repository.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_impl/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_impl/src/users/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Setup Repositories which are responsible for storing and retrieving data.
  final userRepository = UserRepository();
  final settingsRepository = SettingsRepository(
    await SharedPreferences.getInstance(),
  );

  // Setup Controllers which bind Data Storage (Repositories) to Flutter
  // Widgets.
  final userController = UserController(userRepository);
  final settingsController = SettingsController(settingsRepository);

  // Load the user settings from local storage before running the app.
  await settingsController.loadSettings();

  runApp(UserListApp(
    settingsController: settingsController,
    userController: userController,
  ));
}
