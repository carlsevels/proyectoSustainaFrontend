import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sustaina/infrastructure/middleware/authServices.dart';
import 'package:sustaina/infrastructure/models/authentications.model.dart';

class LayoutInternoController extends GetxController with StateMixin {
  final authService = Get.find<AuthService>();
  GetStorage g = GetStorage('xn1');
RxInt currentPageIndex = 0.obs;

  Authentication get user {
    final data = g.read("user");
    return Authentication.fromJson(jsonDecode(data ?? '{}'));
  }

  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    change(null, status: RxStatus.success());
    super.onInit();
  }

void changePage(int index) {
    currentPageIndex.value = index;
  }
}
