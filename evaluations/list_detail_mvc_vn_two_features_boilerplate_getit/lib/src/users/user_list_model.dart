import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user.dart';

class UserListModel {
  final List<User> users;
  final bool loading;
  final bool error;

  UserListModel.initial()
      : users = [],
        error = false,
        loading = false;

  UserListModel.loading()
      : users = [],
        error = false,
        loading = true;

  UserListModel.populated(this.users)
      : error = false,
        loading = false;

  UserListModel.error()
      : users = [],
        error = true,
        loading = false;
}
