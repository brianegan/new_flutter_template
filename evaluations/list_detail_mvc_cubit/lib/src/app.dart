import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_view.dart';
import 'package:list_detail_mvc_cubit/src/users/user_repository.dart';

class UserListApp extends StatelessWidget {
  final UserRepository repository;

  const UserListApp({Key key, @required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: BlocProvider(
        // Setup Controllers which bind Data Storage (Repositories) to Flutter
        // Widgets and begin loading the users when the User List is first shown.
        create: (_) => UserController(repository)..loadUsers(),
        child: UserListView(),
      ),
    );
  }
}
