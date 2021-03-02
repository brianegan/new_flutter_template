import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'dummy_item.dart';
import 'dummy_item_details_view.dart';

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
              Navigator.restorablePushNamed(context, SettingsView.routeName);
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
      body: CustomScrollView(
        slivers: [
          SliverPrototypeExtentList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = items[index];

                return ListTile(
                  title: Text('DummyItem ${item.id}'),
                  leading: const CircleAvatar(
                    // Display the Flutter Logo image asset.
                    foregroundImage:
                        AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      DummyItemDetailsView.routeName,
                    );
                  },
                );
              },
              childCount: items.length,
            ),
            prototypeItem: ListTile(),
          )
        ],
      ),
    );
  }
}
