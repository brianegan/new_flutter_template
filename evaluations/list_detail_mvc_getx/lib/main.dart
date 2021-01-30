import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_detail_mvc_getx/users/user_details_view.dart';
import 'package:list_detail_mvc_getx/users/user_list_controller.dart';
import 'package:list_detail_mvc_getx/users/user_list_view.dart';
import 'package:list_detail_mvc_getx/users/user_repository.dart';

import 'constants.dart';

void main() {
  runApp(
    GetMaterialApp(
        smartManagement: SmartManagement.full,
        home: UserListView(),
        initialBinding: BindingsBuilder(() {
          Get.lazyPut(() => UserController(), fenix: true);
          Get.lazyPut(() => UserRepository(), fenix: true);
        }),
        getPages: [
          GetPage(name: Routes.USER_LIST, page: () => UserListView()),
          GetPage(name: Routes.USER_DETAIL, page: () => UserDetailsView()),
        ]),
  );
}
