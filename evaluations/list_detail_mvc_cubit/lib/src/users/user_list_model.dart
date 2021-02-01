import 'package:list_detail_mvc_cubit/src/users/user.dart';

class UserListModel {
  final List<User> users;
  final bool loading;
  final bool error;

  const UserListModel.initial()
      : users = const [],
        error = false,
        loading = false;

  const UserListModel.loading()
      : users = const [],
        error = false,
        loading = true;

  const UserListModel.populated(List<User> this.users)
      : error = false,
        loading = false;

  const UserListModel.error()
      : users = const [],
        error = true,
        loading = false;
}
