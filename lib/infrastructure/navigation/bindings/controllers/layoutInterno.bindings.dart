import 'package:get/get.dart';
import 'package:sustaina/infrastructure/layout/layoutInterno.controller.dart';
import 'package:sustaina/presentation/login/controllers/login.controller.dart';
import 'package:sustaina/presentation/login/providers/login.provider.dart';


class LayoutInternoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayoutInternoController>(
      () => LayoutInternoController(),
    );
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LoginProvider());
  }
}
