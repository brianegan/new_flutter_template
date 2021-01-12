class User {
  static const loggedOut = User(id: -1);

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  User.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        email = map['email'],
        firstName = map['first_name'],
        lastName = map['last_name'],
        avatar = map['avatar'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, firstName: $firstName, lastName: $lastName, avatar: $avatar}';
  }
}
