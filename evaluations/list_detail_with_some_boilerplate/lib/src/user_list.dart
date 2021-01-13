import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_detail_with_some_boilerplate/src/user.dart';
import 'package:list_detail_with_some_boilerplate/src/user_details.dart';

class UserListPage extends StatelessWidget {
  final List<User> users;

  const UserListPage({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).userList),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];

          return ListTile(
            title: Text(AppLocalizations.of(context).userName(user.id)),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => UserDetailsPage(user: user)),
              );
            },
          );
        },
      ),
    );
  }
}
