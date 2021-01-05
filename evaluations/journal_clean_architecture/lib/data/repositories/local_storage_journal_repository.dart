import 'package:journal_clean_architecture/data/codecs/journal_entry_json_codec.dart';
import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/repositories/journal_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageJournalRepository implements JournalRepository {
  final SharedPreferences preferences;
  final JournalEntryJsonCodec codec;
  final String entryIdsKey;

  LocalStorageJournalRepository(
    this.preferences, {
    this.codec = const JournalEntryJsonCodec(),
    this.entryIdsKey = '__entries',
  });

  @override
  Future<void> addEntry(JournalEntry entry) async {
    await preferences.setString(entry.id, codec.encode(entry));
    await preferences.setStringList(entryIdsKey, [..._allEntries, entry.id]);
  }

  @override
  Future<List<JournalEntry>> entries([List<String> ids]) async {
    final idsToLoad = ids != null && ids.isNotEmpty ? ids : _allEntries;

    return Future.wait([
      for (final id in idsToLoad) entry(id),
    ]);
  }

  @override
  Future<JournalEntry> entry(String id) async =>
      codec.decode(preferences.getString(id));

  @override
  Future<void> removeEntry(String id) async {
    await preferences.remove(id);
    await preferences.setStringList(
      entryIdsKey,
      _allEntries..remove(id),
    );
  }

  @override
  Future<void> updateEntry(JournalEntry entry) =>
      preferences.setString(entry.id, codec.encode(entry));

  List<String> get _allEntries => preferences.getStringList(entryIdsKey) ?? [];
}
