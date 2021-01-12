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
}
