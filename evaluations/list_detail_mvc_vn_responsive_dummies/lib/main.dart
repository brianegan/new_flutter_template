import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/app.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_list_controller.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_repository.dart';

void main() async {
  // Setup Repositories which are responsible for storing and retrieving data
  final repository = DummyRepository();

  // Setup Controllers which bind Data Storage (Repositories) to Flutter
  // Widgets.
  final controller = DummyListController(repository);

  runApp(DummyListApp(controller: controller));
}
