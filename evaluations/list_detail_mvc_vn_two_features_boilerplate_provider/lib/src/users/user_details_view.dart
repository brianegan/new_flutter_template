import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_provider/src/users/user.dart';

class UserDetailsView extends StatelessWidget {
  final User user;

  const UserDetailsView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).userDetails),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).userName(user.id)),
      ),
    );
  }
}
