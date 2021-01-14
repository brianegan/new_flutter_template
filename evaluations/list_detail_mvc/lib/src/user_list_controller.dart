import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:list_detail_mvc/src/user.dart';
import 'package:list_detail_mvc/src/user_repository.dart';

class UserController with ChangeNotifier {
  UserController(this.repository);

  final UserRepository repository;

  List<User> _users;

  List<User> get users => _users;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> loadUsers() async {
    _loading = true;
    notifyListeners();

    try {
      _users = await repository.users();
    } catch (e) {
      _users = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addUser(User user) async {
    _users.add(user);
    await repository.addUser(user);
    notifyListeners();
  }

  Future<void> removeUser(User user) async {
    _users.remove(user);
    await repository.addUser(user);
    notifyListeners();
  }
}
