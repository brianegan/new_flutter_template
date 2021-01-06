import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/repositories/journal_repository.dart';

class JournalService {
  final JournalRepository journalRepository;

  JournalService(this.journalRepository);

  // Repositories merely store data, but Services can make use of the data they
  // load to perform additional operations. In this case, the Service loads the
  // entries from the repository and sorts them in a particular order.
  Future<List<JournalEntry>> entries() async {
    final entries = await journalRepository.entries();

    return entries..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<void> removeEntry(String id) => journalRepository.removeEntry(id);

  Future<void> addEntry(JournalEntry entry) =>
      journalRepository.addEntry(entry);
}
