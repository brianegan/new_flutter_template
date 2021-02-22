import 'package:flutter/material.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item.dart';
import 'package:proposal_1/src/dummy_feature/dummy_item_details_view.dart';
import 'package:proposal_1/src/settings/settings_view.dart';

/// Displays a list of DummyItems.
class DummyItemListView extends StatelessWidget {
  static const routeName = '/';

  const DummyItemListView({
    Key key,
    this.items = const [DummyItem(1), DummyItem(2), DummyItem(3)],
  }) : super(key: key);

  final List<DummyItem> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      // To work with lists that may contain a large number of items, it’s best
      // to use the ListView.builder constructor.
      //
      // In contrast to the default ListView constructor, which requires
      // building all Widgets up front, the ListView.builder constructor lazily
      // builds Widgets as they’re scrolled into view.
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(
            title: Text('DummyItem ${item.id}'),
            leading: const CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, DummyItemDetailsView.routeName);
            },
          );
        },
      ),
    );
  }
}
