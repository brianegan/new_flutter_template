import 'package:flutter/material.dart';
import 'package:list_detail_with_data_layer/src/user_details.dart';
import 'package:list_detail_with_data_layer/src/user_model.dart';
import 'package:list_detail_with_data_layer/src/user_repository.dart';

class MyListPage extends StatefulWidget {
  final UserRepository repository;

  const MyListPage({Key key, @required this.repository}) : super(key: key);

  @override
  _MyListPageState createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
  Future<List<User>> _users;

  @override
  void initState() {
    _users = widget.repository.users();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var user = snapshot.data[index];

                return ListTile(
                  title: Text('User #${user.id}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return MyDetailPage(
                            userId: user.id,
                            repository: widget.repository,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Icon(Icons.error));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
