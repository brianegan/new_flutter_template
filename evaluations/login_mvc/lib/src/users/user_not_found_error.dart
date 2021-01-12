class UserNotFoundError {
  final int id;

  UserNotFoundError(this.id);

  @override
  String toString() => 'User $id not found';
}
