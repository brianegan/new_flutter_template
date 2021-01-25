import 'package:list_detail_mvc_state_notifier/src/users/user.dart';
import 'package:list_detail_mvc_state_notifier/src/users/user_list_model.dart';
import 'package:list_detail_mvc_state_notifier/src/users/user_repository.dart';
import 'package:state_notifier/state_notifier.dart';

class UserListController extends StateNotifier<UserListModel> {
  UserListController(this.repository) : super(UserListModel.initial());

  final UserRepository repository;

  Future<void> loadUsers() async {
    state = UserListModel.loading();

    try {
      state = UserListModel.populated(await repository.users());
    } catch (error) {
      state = UserListModel.error();
    }
  }

  Future<void> addUser(User user) async {
    state = UserListModel.populated([...state.users, user]);
    await repository.addUser(user);
  }

  Future<void> removeUser(User user) async {
    state = UserListModel.populated(state.users..remove(user));
    await repository.addUser(user);
  }
}
