import 'package:list_detail_mvc_dummy/src/dummy.dart';

class DummyRepository {
  Future<List<Dummy>> dummies() {
    return Future.delayed(
      Duration(seconds: 2),
      () => List.generate(5, (_) => Dummy()),
    );
  }

  Future<void> addDummy(Dummy dummy) async {}

  Future<void> removeDummy(Dummy dummy) async {}
}
