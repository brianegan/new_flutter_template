import 'package:flutter/material.dart';
import 'package:list_detail_mvc_provider/src/users/user_details_view.dart';
import 'package:list_detail_mvc_provider/src/users/user_list_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      // This function is called whenever you call Navigator.pushNamed.
      onGenerateRoute: (settings) {
        if (settings.name == '/user') {
          return MaterialPageRoute(
              builder: (c) => UserDetailsView(user: settings.arguments));
        }
        assert(settings.name == '/');
        return MaterialPageRoute(builder: (c) => UserListView());
      },
    );
  }
}
