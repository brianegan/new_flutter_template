import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'dummy_item.dart';
import 'dummy_item_details_view.dart';

/// Displays a list of DummyItems.
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
        title: const Text('Dummy Items'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app, the navigation stack is restored.
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
              // Navigate to the details page. If the user leaves and returns to
              // the app, the navigation stack is restored.
              Navigator.restorablePushNamed(
                context,
                DummyItemDetailsView.routeName,
              );
            },
          );
        },
      ),
    );
  }
}
