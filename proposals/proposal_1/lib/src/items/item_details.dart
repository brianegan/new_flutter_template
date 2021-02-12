import 'package:flutter/material.dart';
import 'package:proposal_1/src/items/item_controller.dart';

class ItemDetailsPage extends StatelessWidget {
  final int id;
  final ItemController controller;

  const ItemDetailsPage({
    Key key,
    @required this.id,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              controller.removeItem(id);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: ItemDetails(id: id),
    );
  }
}

class ItemDetails extends StatelessWidget {
  final int id;

  const ItemDetails({
    Key key,
    @required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Item #$id Information'),
    );
  }
}
