class PantoneColorNotFoundError {
  final String id;

  PantoneColorNotFoundError(this.id);

  @override
  String toString() => 'PantoneColor $id not found';
}
