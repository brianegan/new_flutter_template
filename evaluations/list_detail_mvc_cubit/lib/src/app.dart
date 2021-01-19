import 'package:flutter/material.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_view.dart';

class UserListApp extends StatelessWidget {
  final UserController controller;

  const UserListApp({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: UserListView(controller: controller),
    );
  }
}
