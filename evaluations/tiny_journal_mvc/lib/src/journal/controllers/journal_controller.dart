import 'package:flutter/cupertino.dart';
import 'package:tiny_journal_mvc/src/journal/models/journal_entry.dart';
import 'package:tiny_journal_mvc/src/journal/repositories/journal_repository.dart';

class JournalController with ChangeNotifier {
  JournalController(this.repository);

  final JournalRepository repository;

  bool _loading = false;
  bool _error = false;
  List<JournalEntry> _entries;

  bool get initialized => _entries != null;
  bool get loading => _loading;
  bool get error => _error;
  List<JournalEntry> get entries => _entries;

  Future<void> loadEntries() async {
    _loading = true;
    notifyListeners();

    try {
      _entries = await repository.entries();
      _error = false;
    } catch (e) {
      print(e);
      _entries = [];
      _error = true;
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  JournalEntry entry(String id) =>
      entries.firstWhere((entry) => entry.id == id, orElse: () => null);

  Future<void> addEntry(JournalEntry entry) async {
    await repository.addEntry(entry);
    await loadEntries();
  }

  Future<void> removeEntry(String id) async {
    await repository.removeEntry(id);
    await loadEntries();
  }

  bool isValidTitle(String title) => title.trim().isNotEmpty;

  bool isValidBody(String body) => body.trim().isNotEmpty;
}
