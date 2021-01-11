import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hacker_news_vanilla/src/error_view.dart';
import 'package:hacker_news_vanilla/src/item_view.dart';
import 'package:hacker_news_vanilla/src/models/feed.dart';
import 'package:hacker_news_vanilla/src/news_repository.dart';

class FeedView extends StatefulWidget {
  final NewsRepository repository;

  FeedView({
    Key key,
    @required this.repository,
  }) : super(key: key);

  @override
  _FeedViewState createState() => _FeedViewState();
}

class _FeedViewState extends State<FeedView> {
  Future<Feed> _feed;

  @override
  void initState() {
    _feed = widget.repository.news();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
      ),
      body: FutureBuilder<Feed>(
        future: _feed,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.items.length,
              itemBuilder: (context, index) {
                final feedItem = snapshot.data.items[index];

                return ListTile(
                  title: Text(feedItem.title),
                  subtitle: Text(AppLocalizations.of(context)
                      .commentCount(feedItem.commentsCount)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ItemView(
                            id: feedItem.id,
                            repository: widget.repository,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return ErrorView(
              message: AppLocalizations.of(context).feedLoadingError,
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
