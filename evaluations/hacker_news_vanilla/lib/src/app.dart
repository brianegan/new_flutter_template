import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hacker_news_vanilla/src/feed_view.dart';
import 'package:hacker_news_vanilla/src/news_repository.dart';

class HackerNewsApp extends StatelessWidget {
  final NewsRepository newsRepository;

  const HackerNewsApp({
    Key key,
    @required this.newsRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedView(repository: newsRepository),
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
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
