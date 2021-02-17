import 'package:flutter/material.dart';

/// Displays detailed information about a DummyItem.
class DummyItemDetailsView extends StatelessWidget {
  static const routeName = '/dummy_item';

  const DummyItemDetailsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
