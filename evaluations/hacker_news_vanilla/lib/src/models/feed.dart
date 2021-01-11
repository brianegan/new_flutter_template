import 'package:hacker_news_vanilla/src/models/feed_item.dart';

class Feed {
  final List<FeedItem> items;
  final int currentPage;
  final int nextPage;

  Feed({this.items, this.currentPage, this.nextPage});

  bool get hasNextPage => nextPage != null;

  factory Feed.from({
    List<Map<String, dynamic>> items,
    int currentPage,
    int nextPage,
  }) {
    return Feed(
      items:
          items != null ? items.map((i) => FeedItem.fromJson(i)).toList() : [],
      currentPage: currentPage,
      nextPage: nextPage,
    );
  }

  @override
  String toString() {
    return 'Feed{items: $items, currentPage: $currentPage, nextPage: $nextPage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Feed &&
          runtimeType == other.runtimeType &&
          items == other.items &&
          currentPage == other.currentPage &&
          nextPage == other.nextPage;

  @override
  int get hashCode => items.hashCode ^ currentPage.hashCode ^ nextPage.hashCode;
}
