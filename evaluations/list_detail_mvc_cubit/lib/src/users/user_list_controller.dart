import 'package:bloc/bloc.dart';
import 'package:list_detail_mvc_cubit/src/users/user.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_model.dart';
import 'package:list_detail_mvc_cubit/src/users/user_repository.dart';

class UserController extends Cubit<UserListModel> {
  UserController(this.repository) : super(UserListModel.initial());

  final UserRepository repository;

  Future<void> loadUsers() async {
    emit(UserListModel.loading());

    try {
      emit(UserListModel.populated(await repository.users()));
    } catch (error) {
      emit(UserListModel.error());
    }
  }

  Future<void> addUser(User user) async {
    emit(UserListModel.populated([...state.users, user]));
    await repository.addUser(user);
  }

  Future<void> removeUser(User user) async {
    emit(UserListModel.populated(state.users..remove(user)));
    await repository.addUser(user);
  }
}
