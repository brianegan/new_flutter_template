import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_details_view.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_list_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_list_model.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key key}) : super(key: key);

  @override
  _UserListViewState createState() => _UserListViewState();
}

class _UserListViewState extends State<UserListView> {
  @override
  void initState() {
    // Start Loading the users!
    GetIt.I<UserController>().loadUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I<UserController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).userList),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          )
        ],
      ),
      body: ValueListenableBuilder<UserListModel>(
        valueListenable: controller,
        builder: (context, model, _) {
          if (model.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (model.error) {
            return Center(
                child: Text(AppLocalizations.of(context).userListLoadingError));
          }

          return ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              var user = model.users[index];

              return Dismissible(
                key: ObjectKey(user),
                onDismissed: (_) => controller.removeUser(user),
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text(AppLocalizations.of(context).userName(user.id)),
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
          GetIt.I<UserController>().addUser(User(Random().nextInt(1000)));
        },
      ),
    );
  }
}
