import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/app.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings_repository.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final preferences = await SharedPreferences.getInstance();

  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepository());
  GetIt.I.registerLazySingleton<UserController>(() => UserController());
  GetIt.I.registerLazySingleton<SettingsRepository>(
    () => SettingsRepository(preferences),
  );
  GetIt.I.registerLazySingleton<SettingsController>(() => SettingsController());

  await GetIt.I<SettingsController>().loadSettings();

  runApp(UserListApp());
}
