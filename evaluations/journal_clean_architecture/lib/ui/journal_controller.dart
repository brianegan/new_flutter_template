import 'package:flutter/widgets.dart';
import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/services/journal_service.dart';

class JournalController with ChangeNotifier {
  final JournalService service;
  AsyncSnapshot<List<JournalEntry>> _entries = AsyncSnapshot.nothing();

  JournalController(this.service);

  AsyncSnapshot<List<JournalEntry>> get entries => _entries;

  Future<void> loadEntries() async {
    _entries = AsyncSnapshot.waiting();
    notifyListeners();

    try {
      _entries = AsyncSnapshot.withData(
        ConnectionState.done,
        await service.entries(),
      );
    } catch (e) {
      _entries = AsyncSnapshot.withError(ConnectionState.done, e);
    } finally {
      notifyListeners();
    }
  }

  Future<void> addEntry(JournalEntry entry) async {
    await service.addEntry(entry);
    await loadEntries();
  }

  Future<void> removeEntry(String id) async {
    await service.removeEntry(id);
    await loadEntries();
  }

  AsyncSnapshot<JournalEntry> entry(String id) {
    switch (_entries.connectionState) {
      case ConnectionState.none:
        loadEntries();
        return AsyncSnapshot.waiting();
      case ConnectionState.done:
        if (_entries.hasData) {
          if (_entries.data.any((entry) => entry.id == id)) {
            return AsyncSnapshot.withData(
              ConnectionState.done,
              _entries.data.firstWhere((entry) => entry.id == id),
            );
          } else {
            return AsyncSnapshot.withError(
              ConnectionState.done,
              StateError('Journal Entry Not Found'),
            );
          }
        } else {
          return AsyncSnapshot.withError(ConnectionState.done, _entries.error);
        }
        break;
      default:
        return AsyncSnapshot.waiting();
    }
  }
}
