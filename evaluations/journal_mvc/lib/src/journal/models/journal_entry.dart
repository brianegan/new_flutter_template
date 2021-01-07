import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class JournalEntry {
  final String id;
  final String title;
  final DateTime date;
  final String body;

  JournalEntry({
    @required this.title,
    @required this.body,
    String id,
    DateTime date,
  })  : id = id ?? Uuid().v4(),
        date = date ?? DateTime.now();

  JournalEntry.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        date = DateTime.parse(json['date']),
        body = json['body'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'date': date.toIso8601String(),
      'body': body,
    };
  }

  @override
  String toString() {
    return 'JournalEntry{id: $id, title: $title, date: $date, body: $body}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JournalEntry &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          date == other.date &&
          body == other.body;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ date.hashCode ^ body.hashCode;
}
