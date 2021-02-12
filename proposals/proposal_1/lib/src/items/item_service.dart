import 'package:proposal_1/src/items/item.dart';

// A Service that Manages Item Objects
class ItemService {
  Future<List<Item>> items() {
    return Future.delayed(
      const Duration(seconds: 2),
      () => List.generate(5, (index) => Item(index)),
    );
  }

  Future<void> addItem(Item user) async {}

  Future<void> removeItem(int id) async {}
}
