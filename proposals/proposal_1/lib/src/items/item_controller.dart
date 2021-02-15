import 'package:flutter/foundation.dart';
import 'package:proposal_1/src/items/item.dart';
import 'package:proposal_1/src/items/item_service.dart';
import 'package:proposal_1/src/logging/logging_service.dart';

// A class that many Widgets can interact with to read a List of Item objects,
// update a List of Item objects, or listen to changes.
//
// Controllers glue Data Services to Flutter Widgets.
class ItemController with ChangeNotifier {
  final ItemService itemService;
  final LoggingService loggingService;

  ItemController(this.itemService, this.loggingService);

  bool _initialized = false;
  bool get initialized => _initialized;

  bool _loading = false;
  bool get loading => _loading;

  bool _error = false;
  bool get error => _error;

  List<Item> _items = [];
  List<Item> get items => _items;

  Future<void> initialize() async {
    if (!initialized) {
      await _loadItems();
      _initialized = true;
      notifyListeners();
    }
  }

  Item item(int id) {
    return _items.firstWhere((item) => item.id == id);
  }

  Future<void> addItem(Item item) async {
    _items = [..._items, item];
    notifyListeners();
    await itemService.addItem(item);
  }

  Future<void> removeItem(int id) async {
    _items = [..._items]..removeWhere((item) => item.id == id);
    notifyListeners();
    await itemService.removeItem(id);
  }

  Future<void> _loadItems() async {
    loggingService.debug('Loading Items');
    _loading = true;
    _error = false;
    notifyListeners();

    try {
      _items = await itemService.items();
      loggingService.debug('Successfully loaded Items');
    } catch (exception) {
      _error = true;
      loggingService.debug('Error loading Items');
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
