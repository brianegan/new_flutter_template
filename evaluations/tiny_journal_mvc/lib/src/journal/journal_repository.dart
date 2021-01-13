import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiny_journal_mvc/src/journal/journal_entry.dart';

class JournalRepository {
  final SharedPreferences preferences;
  final String entryIdsKey;

  JournalRepository(
    this.preferences, {
    this.entryIdsKey = '__entries',
  });

  Future<void> addEntry(JournalEntry entry) async {
    await preferences.setString(entry.id, json.encode(entry.toJson()));
    await preferences.setStringList(entryIdsKey, [entry.id, ..._allEntries]);
  }

  Future<List<JournalEntry>> entries() async {
    return Future.wait([
      for (final id in _allEntries) _entry(id),
    ]);
  }

  Future<JournalEntry> _entry(String id) async =>
      JournalEntry.fromJson(json.decode(preferences.getString(id)));

  Future<void> removeEntry(String id) async {
    await preferences.remove(id);
    await preferences.setStringList(
      entryIdsKey,
      _allEntries..remove(id),
    );
  }

  List<String> get _allEntries => preferences.getStringList(entryIdsKey) ?? [];
}
