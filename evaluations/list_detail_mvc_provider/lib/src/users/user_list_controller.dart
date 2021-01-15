import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:list_detail_mvc_provider/src/users/user.dart';
import 'package:list_detail_mvc_provider/src/users/user_repository.dart';

/// This is the controller (the C in MVC). It acts as an intermediary between
/// your views (the UI) and your model (the data and its business logic).
///
/// It lets the UI code only deal with UI, and not with things like
/// requesting new data, caching or notifying other parts of the app about
/// changes.
class UserController with ChangeNotifier {
  UserController(this.repository);

  final UserRepository repository;

  List<User> _users;

  /// The users in memory. The controller is responsible of keeping these
  /// in sync with the users in [repository].
  List<User> get users => _users;

  bool _loading = false;

  bool get loading => _loading;

  Future<void> loadUsers() async {
    _loading = true;
    notifyListeners();

    try {
      _users = await repository.fetchUsers();
    } catch (e) {
      // It is almost always important the user knows about failures like these.
      // For simplicity, we're not doing it here, but in a real app, the
      // controller would deal with this.
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
}
