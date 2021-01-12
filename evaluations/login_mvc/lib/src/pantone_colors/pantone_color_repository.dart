import 'dart:convert';

import 'package:http/http.dart';
import 'package:login_mvc/src/auth/auth_repository.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color_feed.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color_not_found_error.dart';

class PantoneColorRepository {
  final Client httpClient;
  final AuthRepository authRepository;

  PantoneColorRepository(this.httpClient, this.authRepository);

  Future<PantoneColor> color(String id) async {
    final response = await httpClient.get(
      'https://reqres.in/api/colors/$id',
      headers: {'authorization': await authRepository.token},
    );

    if (response.statusCode == 200) {
      return PantoneColor.fromJson(
        json.decode(utf8.decode(response.bodyBytes)),
      );
    } else {
      throw PantoneColorNotFoundError(id);
    }
  }

  Future<PantoneColorFeed> colors() async {
    final response = await httpClient.get(
      'https://reqres.in/api/colors',
      headers: {'authorization': await authRepository.token},
    );

    if (response.statusCode == 200) {
      return PantoneColorFeed.fromJson(
        json.decode(utf8.decode(response.bodyBytes)),
      );
    } else {
      throw StateError('Could not load colors');
    }
  }
}
