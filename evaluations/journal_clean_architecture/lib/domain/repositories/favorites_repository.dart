abstract class FavoritesRepository {
  Future<List<String>> favorites();

  Future<void> addFavorite(String id);

  Future<void> removeFavorite(String id);
}
