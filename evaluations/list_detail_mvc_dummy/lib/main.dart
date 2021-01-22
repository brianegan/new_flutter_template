import 'package:flutter/material.dart';
import 'package:list_detail_mvc_dummy/src/dummy_details_view.dart';
import 'package:list_detail_mvc_dummy/src/dummy_list_controller.dart';
import 'package:list_detail_mvc_dummy/src/dummy_list_view.dart';
import 'package:list_detail_mvc_dummy/src/dummy_repository.dart';

void main() async {
  // Setup Repositories which are responsible for storing and retrieving data
  final repository = DummyRepository();

  // Setup Controllers which bind Data Storage (Repositories) to Flutter
  // Widgets.
  final controller = DummyController(repository);

  runApp(DummyListApp(controller: controller));
}

class DummyListApp extends StatelessWidget {
  final DummyController controller;

  const DummyListApp({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/users':
            return MaterialPageRoute(builder: (_) => DummyDetailsPage());
          case '/':
          default:
            return MaterialPageRoute(
              builder: (_) => DummyListPage(controller: controller),
            );
        }
      },
    );
  }
}
