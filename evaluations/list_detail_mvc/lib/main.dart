import 'package:flutter/material.dart';
import 'package:list_detail_mvc/src/user_list.dart';
import 'package:list_detail_mvc/src/user_list_controller.dart';
import 'package:list_detail_mvc/src/user_repository.dart';

void main() async {
  // Setup Repositories which are responsible for storing and retrieving data
  final repository = UserRepository();

  // Setup Controllers which bind Data Storage (Repositories) to Flutter
  // Widgets.
  final controller = UserController(repository);

  runApp(UserListApp(controller: controller));
}

class UserListApp extends StatelessWidget {
  final UserController controller;

  const UserListApp({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: UserListPage(controller: controller),
    );
  }
}
