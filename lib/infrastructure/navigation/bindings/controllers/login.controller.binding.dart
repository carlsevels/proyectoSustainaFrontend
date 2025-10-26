import 'package:get/get.dart';
import 'package:sustaina/presentation/login/providers/login.provider.dart';

import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut(() => LoginProvider());
  }
}
