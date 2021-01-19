import 'package:flutter/material.dart';
import 'package:list_detail_mvc_cubit/src/app.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_cubit/src/users/user_repository.dart';

void main() async {
  // Setup Repositories which are responsible for storing and retrieving data
  final repository = UserRepository();

  // Setup Controllers which bind Data Storage (Repositories) to Flutter
  // Widgets.
  final controller = UserController(repository);

  runApp(UserListApp(controller: controller));
}
