import 'package:list_detail_mvc_mobx/src/user.dart';
import 'package:list_detail_mvc_mobx/src/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_list_controller.g.dart';

class UserController = _UserController with _$UserController;

abstract class _UserController with Store {
  _UserController(this.repository);

  final UserRepository repository;

  @observable
  ObservableList<User> users;

  @observable
  bool loading;

  @observable
  Object error;

  @computed
  bool get hasError => error != null;

  @action
  Future<void> loadUsers() async {
    loading = true;

    try {
      users = ObservableList.of(await repository.users());
    } catch (e) {
      error = e;
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> addUser(User user) async {
    users.add(user);
    await repository.addUser(user);
  }

  @action
  Future<void> removeUser(User user) async {
    users.remove(user);
    await repository.addUser(user);
  }
}
