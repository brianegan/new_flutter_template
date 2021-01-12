import 'package:flutter/cupertino.dart';
import 'package:login_mvc/src/auth/auth_repository.dart';
import 'package:login_mvc/src/users/user.dart';
import 'package:login_mvc/src/users/user_repository.dart';

class AuthController with ChangeNotifier {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  User _currentUser = User.loggedOut;
  bool _loading = false;
  Object _loginError;

  AuthController(this.authRepository, this.userRepository);

  User get currentUser => _currentUser;

  bool get loggedIn => _currentUser != User.loggedOut;

  bool get loggedOut => _currentUser == User.loggedOut;

  bool get loggingIn => _loading;

  Object get loginError => _loginError;

  bool get hasLoginError => _loginError != null;

  Future<void> login(String username, String password) async {
    _loading = true;
    _loginError = null;
    notifyListeners();

    try {
      final auth = await authRepository.login(username, password);
      _currentUser = await userRepository.user(auth.id);
    } catch (e) {
      _loginError = e;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> register(String username, String password) async {
    _loading = true;
    _loginError = null;
    notifyListeners();

    try {
      final auth = await authRepository.register(username, password);
      _currentUser = await userRepository.user(auth.id);
    } catch (e) {
      _loginError = e;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await authRepository.logout();
    _currentUser = User.loggedOut;
    notifyListeners();
  }

  bool isValidEmail(String input) => input.contains('@');

  bool isValidPassword(String input) => input.length >= 6;
}
