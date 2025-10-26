import 'package:get/get.dart';
import 'package:sustaina/infrastructure/models/providers/equipos_providers.dart';

import '../../../../presentation/equipos/controllers/equipos.controller.dart';

class EquiposControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EquiposController>(
      () => EquiposController(),
    );
    Get.lazyPut(() => EquiposProvider());
  }
}
