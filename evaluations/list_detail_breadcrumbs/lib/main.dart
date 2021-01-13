import 'package:flutter/material.dart';
import 'package:list_detail_breadcrumbs/src/user.dart';
import 'package:list_detail_breadcrumbs/src/user_list.dart';

void main() {
  runApp(MyApp(
    users: List.generate(20, (id) => User(id)),
  ));
}

class MyApp extends StatelessWidget {
  final List<User> users;

  const MyApp({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      home: MyListPage(users: users),
    );
  }
}
