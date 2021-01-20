import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive/src/home.dart';

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      restorationScopeId: 'responsive_template',
      home: HomePage(),
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
