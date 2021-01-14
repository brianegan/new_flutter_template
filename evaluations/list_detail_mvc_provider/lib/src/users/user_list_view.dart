import 'dart:math';

import 'package:flutter/material.dart';
import 'package:list_detail_mvc_provider/src/users/user.dart';
import 'package:list_detail_mvc_provider/src/users/user_list_controller.dart';
import 'package:provider/provider.dart';

class UserListView extends StatefulWidget {
  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  void initState() {
    // Begin loading the users when the User List is first shown.
    final userController = context.read<UserController>();
    userController.loadUsers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: Consumer<UserController>(
        builder: (context, controller, child) {
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              var user = controller.users[index];

              return ListTile(
                title: Text('User #${user.id}'),
                onTap: () =>
                    Navigator.pushNamed(context, '/user', arguments: user),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final newUser = User(Random().nextInt(1000));
          context.read<UserController>().addUser(newUser);
        },
      ),
    );
  }
}
