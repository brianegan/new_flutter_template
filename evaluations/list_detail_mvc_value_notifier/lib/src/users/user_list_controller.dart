import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:list_detail_mvc_value_notifier/src/users/user.dart';
import 'package:list_detail_mvc_value_notifier/src/users/user_list_model.dart';
import 'package:list_detail_mvc_value_notifier/src/users/user_repository.dart';

class UserListController extends ValueNotifier<UserListModel> {
  UserListController(this.repository) : super(UserListModel.initial());

  final UserRepository repository;

  Future<void> loadUsers() async {
    value = UserListModel.loading();

    try {
      value = UserListModel.populated(await repository.users());
    } catch (error) {
      value = UserListModel.error();
    }
  }

  Future<void> addUser(User user) async {
    value = UserListModel.populated([...value.users, user]);
    await repository.addUser(user);
  }

  Future<void> removeUser(User user) async {
    value = UserListModel.populated(value.users..remove(user));
    await repository.addUser(user);
  }
}
