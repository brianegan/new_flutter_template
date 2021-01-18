import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_prettier/src/users/user.dart';
import 'package:list_detail_mvc_vn_prettier/src/users/user_avatar.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UserAvatar(color: user.color, size: 64),
            SizedBox(height: 16),
            Text('User #${user.id}'),
          ],
        ),
      ),
    );
  }
}
