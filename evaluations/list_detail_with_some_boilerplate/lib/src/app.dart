import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:list_detail_with_some_boilerplate/src/user.dart';
import 'package:list_detail_with_some_boilerplate/src/user_list.dart';

class MyApp extends StatelessWidget {
  final List<User> users;

  const MyApp({Key key, @required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserListPage(users: users),
      theme: ThemeData.dark(),
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      locale: Locale.fromSubtags(languageCode: 'en'),
      supportedLocales: [Locale.fromSubtags(languageCode: 'en')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
