import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String message;

  const ErrorView({
    Key key,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning),
          SizedBox(height: 8),
          Text(message),
        ],
      ),
    );
  }
}
