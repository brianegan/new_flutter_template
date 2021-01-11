import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:hacker_news_vanilla/src/error_view.dart';
import 'package:hacker_news_vanilla/src/models/item.dart';
import 'package:hacker_news_vanilla/src/news_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemView extends StatefulWidget {
  final int id;
  final NewsRepository repository;

  const ItemView({
    Key key,
    @required this.id,
    @required this.repository,
  }) : super(key: key);

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  Future<Item> _item;

  @override
  void initState() {
    _item = widget.repository.item(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).itemTitle),
      ),
      body: FutureBuilder<Item>(
        future: _item,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final item = snapshot.data;

            return ListView(
              padding: EdgeInsets.all(16),
              children: [
                Text(item.title, style: Theme.of(context).textTheme.headline3),
                SizedBox(height: 16),
                Text(
                  AppLocalizations.of(context).commentCount(item.commentsCount),
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 8),
                for (final comment in item.comments)
                  ..._buildComments(comment, 0)
              ],
            );
          } else if (snapshot.hasError) {
            return ErrorView(
              message: AppLocalizations.of(context).itemLoadingError,
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  List<Widget> _buildComments(Item comment, int indentationLevel) {
    return [
      _CommentView(
        comment: comment,
        indentationLevel: indentationLevel,
      ),
      if (comment.comments.isNotEmpty)
        for (final comment in comment.comments)
          ..._buildComments(comment, indentationLevel + 1)
    ];
  }
}

class _CommentView extends StatelessWidget {
  final Item comment;
  final int indentationLevel;

  const _CommentView({
    Key key,
    @required this.comment,
    @required this.indentationLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          comment.user ?? AppLocalizations.of(context).deleted,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(height: 12),
        Html(
          style: {
            'body': Style(margin: EdgeInsets.zero),
            'p': Style(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(bottom: 12),
            ),
          },
          data: comment.content,
          onLinkTap: (url) async {
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
        ),
        SizedBox(height: 8),
      ],
    );

    if (indentationLevel > 0) {
      widget = Padding(
        padding: EdgeInsets.only(left: 20),
        child: widget,
      );
    }

    return widget;
  }
}
