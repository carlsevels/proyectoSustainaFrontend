import 'package:get/get.dart';
import 'package:sustaina/infrastructure/models/providers/users.provider.dart';

import '../../../../presentation/ubicaciones/controllers/ubicaciones.controller.dart';

class UbicacionesControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UbicacionesController>(
      () => UbicacionesController(),
    );
    Get.lazyPut(() => UsersProvider());
  }
}
