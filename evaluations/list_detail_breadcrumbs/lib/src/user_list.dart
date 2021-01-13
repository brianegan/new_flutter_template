import 'package:flutter/material.dart';
import 'package:list_detail_vanilla/src/user.dart';
import 'package:list_detail_vanilla/src/user_details.dart';

class MyListPage extends StatelessWidget {
  final List<User> users;

  const MyListPage({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];

          return ListTile(
            title: Text('User #${user.id}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MyDetailPage(user: user)),
              );
            },
          );
        },
      ),
    );
  }
}
