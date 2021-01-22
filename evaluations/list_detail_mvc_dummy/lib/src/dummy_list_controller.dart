import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:list_detail_mvc_dummy/src/dummy.dart';
import 'package:list_detail_mvc_dummy/src/dummy_repository.dart';

class DummyController with ChangeNotifier {
  DummyController(this.repository);

  final DummyRepository repository;

  List<Dummy> _dummies;

  List<Dummy> get dummies => _dummies;

  bool _loading = false;

  bool get loading => _loading;

  bool _error = false;

  bool get error => _error;

  Future<void> loadDummys() async {
    _loading = true;
    _error = false;
    notifyListeners();

    try {
      _dummies = await repository.dummies();
    } catch (e) {
      _error = true;
      _dummies = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addDummy(Dummy dummy) async {
    _dummies.add(dummy);
    await repository.addDummy(dummy);
    notifyListeners();
  }

  Future<void> removeDummy(Dummy dummy) async {
    _dummies.remove(dummy);
    await repository.addDummy(dummy);
    notifyListeners();
  }
}
