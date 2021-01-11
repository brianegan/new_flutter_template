import 'package:flutter/material.dart';
import 'package:hacker_news_vanilla/src/app.dart';
import 'package:hacker_news_vanilla/src/news_repository.dart';

void main() {
  runApp(
    HackerNewsApp(newsRepository: NewsRepository()),
  );
}
