import 'package:flutter/material.dart';
import 'package:list_detail_mvc_riverpod/src/users/user.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({@required this.user, Key key}) : super(key: key);

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
