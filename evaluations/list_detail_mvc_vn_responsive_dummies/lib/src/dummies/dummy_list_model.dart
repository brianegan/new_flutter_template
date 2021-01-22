import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy.dart';

class DummyListModel {
  final List<Dummy> dummies;
  final bool loading;
  final bool error;

  DummyListModel.initial()
      : dummies = [],
        error = false,
        loading = false;

  DummyListModel.loading()
      : dummies = [],
        error = false,
        loading = true;

  DummyListModel.populated(List<Dummy> this.dummies)
      : error = false,
        loading = false;

  DummyListModel.error()
      : dummies = [],
        error = true,
        loading = false;
}
