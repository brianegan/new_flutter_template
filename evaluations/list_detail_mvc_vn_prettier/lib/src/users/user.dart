import 'dart:math';
import 'dart:ui';

import 'package:flutter/rendering.dart';

final random = Random();

class User {
  final int id;
  final Color color;

  User(this.id)
      : color = HSLColor.fromAHSL(
                1,
                random.nextInt(360).toDouble(),
                (random.nextInt(99 - 42).toDouble() + 42) / 100,
                (random.nextInt(90 - 40).toDouble() + 40) / 100)
            .toColor();
}
