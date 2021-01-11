import 'package:hacker_news_vanilla/src/models/item_type.dart';

class FeedItem {
  final int id;
  final String title;
  final int points;
  final String user;
  final int time;
  final String timeAgo;
  final int commentsCount;
  final ItemType type;
  final String url;
  final String domain;

  FeedItem({
    this.id,
    this.title,
    this.points,
    this.user,
    this.time,
    this.timeAgo,
    this.commentsCount,
    this.type,
    this.url,
    this.domain,
  });

  FeedItem.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        points = json['points'],
        user = json['user'],
        time = json['time'],
        timeAgo = json['time_ago'],
        commentsCount = json['comments_count'],
        type = itemTypeFromJson(json['type']),
        url = json['url'],
        domain = json['domain'];

  @override
  String toString() {
    return 'FeedItem{id: $id, title: $title, points: $points, user: $user, time: $time, timeAgo: $timeAgo, commentsCount: $commentsCount, type: $type, url: $url, domain: $domain}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FeedItem &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          points == other.points &&
          user == other.user &&
          time == other.time &&
          timeAgo == other.timeAgo &&
          commentsCount == other.commentsCount &&
          type == other.type &&
          url == other.url &&
          domain == other.domain;

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      points.hashCode ^
      user.hashCode ^
      time.hashCode ^
      timeAgo.hashCode ^
      commentsCount.hashCode ^
      type.hashCode ^
      url.hashCode ^
      domain.hashCode;
}
