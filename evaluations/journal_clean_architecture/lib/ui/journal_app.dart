import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:journal_clean_architecture/ui/navigation/app_route_information_parser.dart';
import 'package:journal_clean_architecture/ui/navigation/app_router_delegate.dart';

class JournalApp extends StatefulWidget {
  final AppRouterDelegate routerDelegate;

  const JournalApp({Key key, this.routerDelegate}) : super(key: key);

  @override
  _JournalAppState createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  final routeInformationParser = const AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      routeInformationParser: routeInformationParser,
      routerDelegate: widget.routerDelegate,
    );
  }
}
