
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sustaina/infrastructure/layout/layoutExterno.dart';
import 'package:sustaina/infrastructure/layout/layoutInterno.dart';
import 'package:sustaina/infrastructure/middleware/authServices.dart';


class Layout extends StatelessWidget {
  final Widget? child;
  Layout({this.child});
  final authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authService.isLogin.value == true
          ? LayoutInterno(child: child)
          : LayoutExterno(child: child),
    );
  }
}
