import 'package:flutter/material.dart';

class DummyItemDetailsView extends StatelessWidget {
  static const routeName = '/dummy_item';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Item'),
      ),
      body: Center(
        child: Text('Item details'),
      ),
    );
  }
}
