import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_prettier/src/settings/settings.dart';
import 'package:list_detail_mvc_vn_prettier/src/settings/settings_controller.dart';
import 'package:list_detail_mvc_vn_prettier/src/settings/settings_view.dart';
import 'package:list_detail_mvc_vn_prettier/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_vn_prettier/src/users/user_list_view.dart';

class UserListApp extends StatelessWidget {
  final UserController userController;
  final SettingsController settingsController;

  const UserListApp({
    Key key,
    @required this.userController,
    @required this.settingsController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Settings>(
      valueListenable: settingsController,
      builder: (context, settings, _) {
        return MaterialApp(
          title: 'List/Detail Demo',
          theme:
              settings.theme == AppTheme.light ? ThemeData() : ThemeData.dark(),
          routes: {
            '/': (context) => UserListView(controller: userController),
            '/settings': (context) =>
                SettingsView(controller: settingsController),
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
