import 'package:flutter/material.dart';
import 'package:list_detail_vanilla/src/user.dart';

class MyDetailPage extends StatelessWidget {
  final User user;

  const MyDetailPage({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Text('User #${user.id}'),
      ),
    );
  }
}
