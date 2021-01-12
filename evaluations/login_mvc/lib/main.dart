import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:login_mvc/src/app.dart';
import 'package:login_mvc/src/auth/auth_controller.dart';
import 'package:login_mvc/src/auth/auth_repository.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color_repository.dart';
import 'package:login_mvc/src/users/user_repository.dart';

void main() {
  final httpClient = Client();

  // Repositories store data of some kind! They might store data in-memory,
  // on-disk, or over the network.
  final authRepository = AuthRepository(httpClient);
  final userRepository = UserRepository(httpClient, authRepository);
  final colorRepository = PantoneColorRepository(httpClient, authRepository);

  // You may introduce some kind of "Controller" to glue data from your
  // repositories to Widgets.
  final authController = AuthController(authRepository, userRepository);

  runApp(
    LoginDemoApp(
      navigatorKey: GlobalKey<NavigatorState>(),
      authController: authController,
      colorRepository: colorRepository,
    ),
  );
}
