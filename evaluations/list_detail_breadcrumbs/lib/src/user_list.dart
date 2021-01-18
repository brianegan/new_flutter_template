import 'package:flutter/material.dart';
import 'package:list_detail_breadcrumbs/src/user.dart';
import 'package:list_detail_breadcrumbs/src/user_details.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({Key key}) : super(key: key);

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  List<User> _users;

  @override
  void initState() {
    // "Load" the users
    _users = List.generate(20, (id) => User(id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          var user = _users[index];

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
