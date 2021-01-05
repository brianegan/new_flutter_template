import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/repositories/journal_repository.dart';
import 'package:journal_clean_architecture/domain/repositories/favorites_repository.dart';

class JournalService {
  final JournalRepository journalRepository;
  final FavoritesRepository favoritesRepository;

  JournalService(this.journalRepository, this.favoritesRepository);

  Future<List<JournalEntry>> entries() async {
    final entries = await journalRepository.entries();

    return entries..sort((a, b) => a.date.compareTo(b.date));
  }

  Future<List<JournalEntry>> favorites() async {
    final ids = await favoritesRepository.favorites();

    return journalRepository.entries(ids);
  }

  Future<JournalEntry> entry(String id) => journalRepository.entry(id);

  Future<void> removeEntry(String id) => journalRepository.removeEntry(id);

  Future<void> addEntry(JournalEntry entry) =>
      journalRepository.addEntry(entry);

  Future<void> updateEntry(JournalEntry entry) =>
      journalRepository.updateEntry(entry);

  Future<void> addFavorite(String id) => favoritesRepository.addFavorite(id);

  Future<void> removeFavorite(String id) =>
      favoritesRepository.removeFavorite(id);
}
