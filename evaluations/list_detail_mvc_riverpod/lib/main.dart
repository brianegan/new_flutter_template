import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:list_detail_mvc_riverpod/src/app.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
