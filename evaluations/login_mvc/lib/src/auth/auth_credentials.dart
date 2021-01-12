class AuthCredentials {
  final int id;
  final String token;

  AuthCredentials({this.id, this.token});

  AuthCredentials.fromJson(Map<String, dynamic> map)
      : id = map['id'] ?? 1,
        token = map['token'];
}
