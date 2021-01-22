import 'package:flutter/material.dart';
import 'package:list_detail_mvc_dummy/src/dummy.dart';
import 'package:list_detail_mvc_dummy/src/dummy_list_controller.dart';

class DummyListPage extends StatefulWidget {
  final DummyController controller;

  const DummyListPage({Key key, @required this.controller}) : super(key: key);

  @override
  _DummyListPageState createState() => _DummyListPageState();
}

class _DummyListPageState extends State<DummyListPage> {
  @override
  void initState() {
    // Begin loading the dummies when the Dummy List is first shown.
    widget.controller.loadDummys();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dummy List'),
      ),
      body: AnimatedBuilder(
        animation: widget.controller,
        builder: (context, _) {
          if (widget.controller.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (widget.controller.error) {
            return Center(child: Icon(Icons.error));
          }

          return ListView.builder(
            itemCount: widget.controller.dummies.length,
            itemBuilder: (context, index) {
              var dummy = widget.controller.dummies[index];

              return Dismissible(
                key: ObjectKey(dummy),
                onDismissed: (_) => widget.controller.removeDummy(dummy),
                background: Container(color: Colors.red),
                child: ListTile(
                  title: Text('Dummy $index'),
                  onTap: () => Navigator.pushNamed(context, '/users'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => widget.controller.addDummy(Dummy()),
      ),
    );
  }
}
