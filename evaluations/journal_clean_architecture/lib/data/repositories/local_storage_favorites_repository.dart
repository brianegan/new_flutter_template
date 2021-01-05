import 'package:journal_clean_architecture/domain/repositories/favorites_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageFavoritesRepository implements FavoritesRepository {
  final SharedPreferences preferences;
  final String favoriteIdsKey;

  LocalStorageFavoritesRepository(
    this.preferences, {
    this.favoriteIdsKey = '__favorites',
  });

  @override
  Future<void> addFavorite(String id) async {
    await preferences.setStringList(favoriteIdsKey, [
      ...(await favorites()),
      id,
    ]);
  }

  @override
  Future<List<String>> favorites() async =>
      preferences.getStringList(favoriteIdsKey);

  @override
  Future<void> removeFavorite(String id) async {
    await preferences.setStringList(
      favoriteIdsKey,
      (await favorites())..remove(id),
    );
  }
}
