class AuthError {
  final String message;

  AuthError(this.message);

  AuthError.fromJson(Map<String, dynamic> map) : message = map['error'];

  @override
  String toString() => message;
}
