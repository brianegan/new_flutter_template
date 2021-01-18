import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/users/user.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/users/user_details_view.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/users/user_list_controller.dart';
import 'package:provider/provider.dart';

class UserListView extends StatelessWidget {
  const UserListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Consumer<UserController>(
        builder: (context, controller, _) {
          final model = controller.value;

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
          context.read<UserController>().addUser(User(Random().nextInt(1000)));
        },
      ),
    );
  }
}
