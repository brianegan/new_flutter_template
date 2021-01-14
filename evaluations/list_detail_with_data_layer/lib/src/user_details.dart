import 'package:flutter/material.dart';
import 'package:list_detail_with_data_layer/src/user_model.dart';
import 'package:list_detail_with_data_layer/src/user_repository.dart';

class MyDetailPage extends StatefulWidget {
  final int userId;
  final UserRepository repository;

  const MyDetailPage({
    Key key,
    @required this.userId,
    @required this.repository,
  }) : super(key: key);

  @override
  _MyDetailPageState createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
  Future<User> _user;

  @override
  void initState() {
    _user = widget.repository.user(widget.userId);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MyDetailPage oldWidget) {
    if (widget.userId != oldWidget.userId) {
      _user = widget.repository.user(widget.userId);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: FutureBuilder<User>(
        future: _user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text('User #${snapshot.data.id}'),
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
