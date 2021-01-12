import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_mvc/src/auth/auth_credentials.dart';
import 'package:login_mvc/src/auth/auth_error.dart';

class AuthRepository {
  final Client httpClient;
  AuthCredentials _credentials;

  AuthRepository(this.httpClient);

  Future<String> get token async => _credentials.token;

  Future<AuthCredentials> login(String username, String password) =>
      _loginOrRegister('login', username, password);

  Future<AuthCredentials> register(String username, String password) =>
      _loginOrRegister('register', username, password);

  Future<void> logout() async => _credentials = null;

  Future<AuthCredentials> _loginOrRegister(
    String endpoint,
    String username,
    String password,
  ) async {
    final response = await httpClient.post(
      'https://reqres.in/api/$endpoint',
      body: {'email': username, 'password': password},
    );

    final map = json.decode(utf8.decode(response.bodyBytes));

    if (response.statusCode == 200) {
      _credentials = AuthCredentials.fromJson(map);

      return _credentials;
    } else {
      throw AuthError.fromJson(map);
    }
  }
}
