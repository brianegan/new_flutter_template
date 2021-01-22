import 'package:flutter/material.dart';

class DummyDetailsView extends StatelessWidget {
  final int id;

  const DummyDetailsView({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DummyContent(id: id),
    );
  }
}

class DummyContent extends StatelessWidget {
  final int id;

  const DummyContent({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('Dummy $id'),
          flexibleSpace: Container(color: Theme.of(context).appBarTheme.backgroundColor),
          expandedHeight: 200,
          floating: true,
          pinned: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ListTile(
                title: Text("Dummy Info $index"),
              );
            },
            childCount: 30,
          ),
        ),
      ],
    );
  }
}
