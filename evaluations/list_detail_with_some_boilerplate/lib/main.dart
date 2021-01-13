import 'package:flutter/material.dart';
import 'package:list_detail_with_some_boilerplate/src/app.dart';
import 'package:list_detail_with_some_boilerplate/src/user.dart';

void main() {
  runApp(MyApp(
    users: List.generate(20, (id) => User(id)),
  ));
}
