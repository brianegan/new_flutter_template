import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_mvc/src/auth/auth_repository.dart';
import 'package:login_mvc/src/users/user.dart';
import 'package:login_mvc/src/users/user_not_found_error.dart';

class UserRepository {
  final Client httpClient;
  final AuthRepository authRepository;

  UserRepository(this.httpClient, this.authRepository);

  Future<User> user(int id) async {
    final response = await httpClient.get(
      'https://reqres.in/api/users/$id',
      headers: {'authorization': await authRepository.token},
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw UserNotFoundError(id);
    }
  }
}
