import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_detail_mvc_cubit/src/users/user.dart';
import 'package:list_detail_mvc_cubit/src/users/user_details_view.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_cubit/src/users/user_list_model.dart';

class UserListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
      ),
      body: BlocBuilder<UserController, UserListModel>(
        builder: (context, model) {
          if (model.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (model.error) {
            return Center(child: Text('Oh no! Could not load the users'));
          }

          return ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              final user = model.users[index];

              return Dismissible(
                key: ObjectKey(user),
                onDismissed: (_) {
                  context.read<UserController>().removeUser(user);
                },
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text('User #${user.id}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserDetailsView(user: user),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          context.read<UserController>().addUser(User(Random().nextInt(1000)));
        },
      ),
    );
  }
}
