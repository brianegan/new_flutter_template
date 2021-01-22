import 'package:flutter/material.dart';
import 'package:list_detail_mvc_dummy/src/dummy.dart';

class DummyDetailsPage extends StatelessWidget {
  final Dummy dummy;

  const DummyDetailsPage({Key key, this.dummy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Details'),
      ),
      body: Center(
        child: Text('Dummy Content'),
      ),
    );
  }
}
