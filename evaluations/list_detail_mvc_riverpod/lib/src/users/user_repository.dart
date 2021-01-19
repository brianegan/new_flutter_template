import 'dart:math';

import 'package:flutter_riverpod/all.dart';
import 'package:list_detail_mvc_riverpod/src/users/user.dart';

final userRepositoryProvider = Provider((_) => UserRepository());

/// This is the repository. It surfaces data that your app works with,
/// and allows modifying it at the source.
///
/// This data could be living in Firebase, SQLite, the disk, or any other
/// source. It's the repository's responsibility to deal with those sources.
class UserRepository {
  Future<List<User>> fetchUsers() {
    return Future.delayed(
      Duration(seconds: 2),
      () => List.generate(5, (index) => User(Random().nextInt(1000))),
    );
  }

  Future<void> addUser(User user) async {}

  Future<void> removeUser(User user) async {}
}
