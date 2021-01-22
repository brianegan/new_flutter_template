import 'package:flutter/material.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_details_view.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_list_controller.dart';
import 'package:list_detail_mvc_vn_responsive_dummies/src/dummies/dummy_list_model.dart';

class DummyListView extends StatefulWidget {
  final DummyListController controller;

  const DummyListView({Key key, @required this.controller}) : super(key: key);

  @override
  _DummyListViewState createState() => _DummyListViewState();
}

class _DummyListViewState extends State<DummyListView> {
  Dummy _selectedDummy;

  @override
  void initState() {
    // Begin loading the dummies when the Dummy List View is first shown.
    widget.controller.loadDummies();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final smallScreen = constraints.minWidth < 1024;
        final listView = _ListView(
          controller: widget.controller,
          onDummyTapped: (dummy) => _onDummyTapped(dummy, smallScreen),
        );

        return Scaffold(
          appBar: AppBar(
            title: Text('Dummy List'),
          ),
          body: smallScreen
              ? listView
              : Row(children: [
                  SizedBox(width: 300, child: listView),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: _selectedDummy != null
                          ? DummyContent(id: _selectedDummy.id)
                          : Center(child: Text('Select a Dummy from the List')),
                    ),
                  ),
                ]),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => widget.controller.addDummy(),
          ),
        );
      },
    );
  }

  void _onDummyTapped(Dummy dummy, bool smallScreen) {
    setState(() {
      _selectedDummy = dummy;
    });

    if (smallScreen) {
      Navigator.pushNamed(context, '/dummy/${dummy.id}');
    }
  }
}

class _ListView extends StatelessWidget {
  const _ListView({
    Key key,
    @required this.controller,
    @required this.onDummyTapped,
  }) : super(key: key);

  final DummyListController controller;
  final void Function(Dummy dummy) onDummyTapped;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<DummyListModel>(
      valueListenable: controller,
      builder: (context, model, _) {
        if (model.loading) {
          return Center(child: CircularProgressIndicator());
        } else if (model.error) {
          return Center(child: Text('Oh no! Could not load the dummies'));
        }

        return ListView.builder(
          itemCount: model.dummies.length,
          itemBuilder: (context, index) {
            var dummy = model.dummies[index];

            return Dismissible(
              key: ObjectKey(dummy),
              onDismissed: (_) => controller.removeDummy(dummy),
              background: Container(color: Colors.red),
              child: ListTile(
                title: Text('Dummy #${dummy.id}'),
                onTap: () => onDummyTapped(dummy),
              ),
            );
          },
        );
      },
    );
  }
}
