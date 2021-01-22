import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_details_view.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_list_controller.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_list_view.dart';

class DummyListApp extends StatelessWidget {
  final DummyListController controller;

  const DummyListApp({Key key, @required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List/Detail Demo',
      theme: ThemeData.dark(),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) {
            return settings.name.contains('dummy')
                ? DummyDetailsView(id: int.parse(settings.name.split('/').last))
                : DummyListView(controller: controller);
          },
        );
      },
      home: DummyListView(controller: controller),
    );
  }
}
