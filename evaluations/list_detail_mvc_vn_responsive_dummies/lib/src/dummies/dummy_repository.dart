import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy.dart';

class DummyRepository {
  Future<List<Dummy>> dummies() {
    return Future.delayed(
      Duration(seconds: 2),
      () => List.generate(5, (index) => Dummy(index)),
    );
  }

  Future<void> addDummy(Dummy dummy) async {}

  Future<void> removeDummy(Dummy dummy) async {}
}
