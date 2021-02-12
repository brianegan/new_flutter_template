import 'package:flutter/material.dart';
import 'package:proposal_1/src/items/item.dart';
import 'package:proposal_1/src/items/item_controller.dart';
import 'package:proposal_1/src/items/item_details.dart';

class ItemList extends StatefulWidget {
  final ItemController controller;

  const ItemList({Key key, @required this.controller}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Item _selectedItem;

  void _onItemTapped(Item item) {
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  void initState() {
    // Begin loading the users when the Item List is first shown.
    widget.controller.initialize();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, _) {
        if (widget.controller.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (widget.controller.error) {
          return const Center(child: Text('Oh no! Could not load the users'));
        }

        return LayoutBuilder(builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Items'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                )
              ],
            ),
            body: constraints.maxWidth < 600
                ? _buildMobileContent(context)
                : _buildTabletContent(context),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                widget.controller.addItem(Item(widget.controller.items.length));
              },
            ),
          );
        });
      },
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    return _ListView(
      items: widget.controller.items,
      onItemTapped: (item) {
        _onItemTapped(item);
        Navigator.pushNamed<void>(context, '/item/${item.id}');
      },
    );
  }

  Widget _buildTabletContent(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 200,
          child: _ListView(
            items: widget.controller.items,
            onItemTapped: _onItemTapped,
          ),
        ),
        Container(
          width: 1,
          color: Theme.of(context).dividerColor,
        ),
        Expanded(
          child: _selectedItem != null
              ? ItemDetails(id: _selectedItem.id)
              : _NoItemSelected(),
        )
      ],
    );
  }
}

class _NoItemSelected extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No Item Selected'));
  }
}

class _ListView extends StatelessWidget {
  final List<Item> items;
  final void Function(Item item) onItemTapped;

  const _ListView({
    Key key,
    @required this.items,
    @required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return ListTile(
          leading: const CircleAvatar(
            foregroundImage: AssetImage('assets/images/flutter_logo.png'),
          ),
          title: Text('Item #${item.id}'),
          onTap: () => onItemTapped(item),
        );
      },
    );
  }
}
