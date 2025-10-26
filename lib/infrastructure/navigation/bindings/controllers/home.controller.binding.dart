import 'package:get/get.dart';
import 'package:sustaina/infrastructure/layout/layoutInterno.controller.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut(() => LayoutInternoController());
  }
}
