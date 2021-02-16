import 'package:flutter/material.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item_details_view.dart';
import 'package:proposal_1/src/settings/settings_view.dart';

class DummyItemListView extends StatelessWidget {
  const DummyItemListView({
    Key key,
    this.items = const [DummyItem(1), DummyItem(2), DummyItem(3)],
  }) : super(key: key);

  static const routeName = '/';
  final List<DummyItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: Text('DummyItem ${item.id}'),
            leading: CircleAvatar(
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                DummyItemDetailsView.routeName,
                arguments: item,
              );
            },
          );
        },
      ),
    );
  }
}
