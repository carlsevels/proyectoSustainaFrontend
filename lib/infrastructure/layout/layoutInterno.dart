import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sustaina/infrastructure/layout/layoutInterno.controller.dart';
import 'package:sustaina/infrastructure/middleware/authServices.dart';
import 'package:sustaina/infrastructure/navigation/routes.dart';

// ignore: must_be_immutable
class LayoutInterno extends StatelessWidget {
  final Widget? child;
  LayoutInterno({this.child});
  final authService = Get.find<AuthService>();

  final LayoutInternoController controller =
      GetInstance().find<LayoutInternoController>();

  @override
  Widget build(BuildContext context) {
    return Overlay(initialEntries: [
      OverlayEntry(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: InkWell(
              child: Text(authService.rol.value.name ?? ""),
              onTap: () {
                Get.offAndToNamed(Routes.HOME);
              },
            ),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Equipos'),
                  onTap: () async {
                    Get.toNamed(Routes.EQUIPOS);
                  },
                ),
                ListTile(
                  title: Text('Ubicaciones'),
                  onTap: () async {
                    Get.toNamed(Routes.UBICACIONES);
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () async {
                    GetStorage g = GetStorage('xn1');
                    g.remove("user");
                    g.remove("isLogin");
                    await authService.setLogin(false);
                    Get.offAndToNamed(Routes.LOGIN);
                  },
                ),
              ],
            ),
          ),
          body: Center(
              child: Stack(
            alignment: Alignment.topCenter,
            children: [
              child!,
            ],
          )),
        );
      })
    ]);
  }
}
