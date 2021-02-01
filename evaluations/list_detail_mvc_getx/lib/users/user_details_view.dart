import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_detail_mvc_getx/users/user.dart';

class UserDetailsView extends StatelessWidget {
  final User user = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: Text('User #${user.id}'),
      ),
    );
  }
}
