import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_detail_mvc_getx/constants.dart';
import 'package:list_detail_mvc_getx/users/user_list_controller.dart';
import 'package:list_detail_mvc_getx/users/user.dart';


class UserListView extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: Text('User List')),
      body: GetX<UserController>(
        builder: (controller) {
          if (controller.loading) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: controller.users.length,
            itemBuilder: (context, index) {
              var user = controller.users[index];

              return ListTile(
                title: Text('User #${user.id}'),
                onTap: () => Get.toNamed(Routes.USER_DETAIL, arguments: user),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final newUser = User(Random().nextInt(1000));
          Get.find<UserController>().addUser(newUser);
        },
      ),
    );
  }
}
