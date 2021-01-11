import 'dart:convert';

import 'package:hacker_news_vanilla/src/models/feed.dart';
import 'package:hacker_news_vanilla/src/models/item.dart';
import 'package:http/http.dart';

class NewsRepository {
  final Client client;

  NewsRepository({Client client}) : client = client ?? Client();

  Future<Feed> news({int page = 1}) async {
    assert(page >= 1 && page <= 10, 'News endpoints provide pages 1-10');

    final response =
        await client.get('https://api.hnpwa.com/v0/news/$page.json');

    if (response.statusCode == 200) {
      return Feed.from(
        items: json
            .decode(utf8.decode(response.bodyBytes))
            .cast<Map<String, dynamic>>(),
        currentPage: page,
        nextPage: page < 10 ? page + 1 : null,
      );
    } else {
      throw Exception(
        '${response.statusCode} Error Fetching News Feed: ${response.body}',
      );
    }
  }

  Future<Item> item(int id) async {
    final response = await client.get('https://api.hnpwa.com/v0/item/$id.json');

    if (response.statusCode == 200) {
      return Item.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw Exception(
        '${response.statusCode} Error Fetching Item: ${response.body}',
      );
    }
  }
}
