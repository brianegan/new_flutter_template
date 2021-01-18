import 'package:flutter/material.dart';
import 'package:list_detail_breadcrumbs/src/user_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: MyListPage(),
    );
  }
}
