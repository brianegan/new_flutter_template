import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_list_model.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_repository.dart';

class DummyListController extends ValueNotifier<DummyListModel> {
  DummyListController(this.repository) : super(DummyListModel.initial());

  final DummyRepository repository;

  Future<void> loadDummies() async {
    value = DummyListModel.loading();

    try {
      value = DummyListModel.populated(await repository.dummies());
    } catch (error) {
      value = DummyListModel.error();
    }
  }

  Future<void> addDummy() async {
    final dummy = Dummy(value.dummies.length);
    value = DummyListModel.populated([...value.dummies, dummy]);
    await repository.addDummy(dummy);
  }

  Future<void> removeDummy(Dummy dummy) async {
    value = DummyListModel.populated(value.dummies..remove(dummy));
    await repository.addDummy(dummy);
  }
}
