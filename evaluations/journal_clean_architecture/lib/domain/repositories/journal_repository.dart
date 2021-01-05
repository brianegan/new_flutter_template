import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';

abstract class JournalRepository {
  Future<List<JournalEntry>> entries([List<String> ids]);
  Future<JournalEntry> entry(String id);
  Future<void> removeEntry(String id);
  Future<void> addEntry(JournalEntry entry);
  Future<void> updateEntry(JournalEntry entry);
}
