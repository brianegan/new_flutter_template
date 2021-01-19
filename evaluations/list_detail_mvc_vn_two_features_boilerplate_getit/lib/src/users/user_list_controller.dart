import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_list_model.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_repository.dart';

class UserController extends ValueNotifier<UserListModel> {
  UserController() : super(UserListModel.initial());

  Future<void> loadUsers() async {
    value = UserListModel.loading();

    try {
      value = UserListModel.populated(await GetIt.I<UserRepository>().users());
    } catch (error) {
      value = UserListModel.error();
    }
  }

  Future<void> addUser(User user) async {
    value = UserListModel.populated([...value.users, user]);
    await GetIt.I<UserRepository>().addUser(user);
  }

  Future<void> removeUser(User user) async {
    value = UserListModel.populated(value.users..remove(user));
    await GetIt.I<UserRepository>().addUser(user);
  }
}
