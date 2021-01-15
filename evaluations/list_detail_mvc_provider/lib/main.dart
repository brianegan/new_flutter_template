import 'package:flutter/material.dart';
import 'package:list_detail_mvc_provider/src/app.dart';
import 'package:list_detail_mvc_provider/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_provider/src/users/user_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserController(UserRepository())),
        // Provide more controllers here.
      ],
      child: MyApp(),
    ),
  );
}
