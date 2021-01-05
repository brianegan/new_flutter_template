import 'package:flutter/material.dart';

class UnknownRouteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Oh no!"),
      ),
      body: Center(
        child: Text("Sorry! We could not find that page :("),
      ),
    );
  }
}
