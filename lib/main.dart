import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sustaina/infrastructure/layout/layout.dart';
import 'package:sustaina/infrastructure/middleware/authServices.dart';
import 'package:sustaina/infrastructure/models/authentications.model.dart';
import 'package:sustaina/infrastructure/models/users.dart';
import 'package:sustaina/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:sustaina/infrastructure/navigation/bindings/controllers/layoutInterno.bindings.dart';
import 'package:sustaina/presentation/login/providers/login.provider.dart';
import 'package:sustaina/presentation/screens.dart';

import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
    await GetStorage.init();
  Get.put(AuthService());
  Get.put(UbicacionesController());
  await GetStorage.init('xn1');
  GetStorage g = GetStorage('xn1');
  await Get.putAsync(() => AuthService().init());
  final authService = Get.find<AuthService>();

  Authentication? user;
  if (g.read("user") != null) {
    user = Authentication.fromJson(jsonDecode(g.read("user")));
    authService.setRol(user.user?.rol!.id ?? 0);
    authService.setRoles(user.user?.rol ?? Roles());
  } else {
    user = null;
    await authService.setRol(0);
    await authService.setRoles(Roles());

  }
  if (user != null) {
    authService.setLogin(g.read('isLogin') ?? false);
    RootBinding().dependencies();
  }

  // RootBinding().dependencies();
  // setPathUrlStrategy();
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
      initialBinding: LoginControllerBinding(),
      onReady: () {
        final authService = Get.find<AuthService>();
        authService.setCurrentRoute(Get.currentRoute);
        Get.lazyPut(() => LoginProvider());
      },
      builder: (BuildContext context, Widget? child) {
        return Layout(
          child: child,
        );
      },
    );
  }
}


class RootBinding implements Bindings {
  @override
  void dependencies() {
    LayoutInternoBindings().dependencies();
  }
}