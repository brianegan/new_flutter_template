import 'dart:math';

import 'package:list_detail_mvc_vn_prettier/src/users/user.dart';

class UserRepository {
  Future<List<User>> users() {
    return Future.delayed(
      Duration(seconds: 2),
      () => List.generate(5, (index) => User(Random().nextInt(1000))),
    );
  }

  Future<void> addUser(User user) async {}

  Future<void> removeUser(User user) async {}
}
