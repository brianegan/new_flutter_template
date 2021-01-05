import 'dart:convert';

import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';

class JournalEntryJsonCodec extends Codec<JournalEntry, String> {
  const JournalEntryJsonCodec();

  @override
  Converter<String, JournalEntry> get decoder =>
      const _JournalEntryJsonDecoder();

  @override
  Converter<JournalEntry, String> get encoder =>
      const _JournalEntryJsonEncoder();
}

class _JournalEntryJsonDecoder extends Converter<String, JournalEntry> {
  const _JournalEntryJsonDecoder();

  @override
  JournalEntry convert(String input) {
    final map = json.decode(input);

    return JournalEntry(
      id: map['id'],
      title: map['title'],
      date: DateTime.parse(map['date']),
      body: map['body'],
    );
  }
}

class _JournalEntryJsonEncoder extends Converter<JournalEntry, String> {
  const _JournalEntryJsonEncoder();

  @override
  String convert(JournalEntry input) {
    return json.encode({
      "id": input.id,
      "title": input.title,
      "date": input.date.toIso8601String(),
      "body": input.body,
    });
  }
}
