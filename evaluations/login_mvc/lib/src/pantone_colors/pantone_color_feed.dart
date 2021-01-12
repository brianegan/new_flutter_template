import 'package:login_mvc/src/pantone_colors/pantone_color.dart';

class PantoneColorFeed {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<PantoneColor> colors;

  PantoneColorFeed({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.colors,
  });

  PantoneColorFeed.fromJson(Map<String, dynamic> map)
      : page = map['page'],
        perPage = map['per_page'],
        total = map['total'],
        totalPages = map['total_pages'],
        colors = (map['data'] ?? [])
            .cast<Map<String, dynamic>>()
            .map<PantoneColor>((json) => PantoneColor.fromJson(json))
            .toList();
}
