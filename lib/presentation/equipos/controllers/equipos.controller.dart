import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sustaina/infrastructure/models/authentications.model.dart';
import 'package:sustaina/infrastructure/models/users.dart';
import 'package:sustaina/infrastructure/models/providers/equipos_providers.dart';

GetStorage g = GetStorage('xn1');

class EquiposController extends GetxController with StateMixin {
  //TODO: Implement EquiposController
  Authentication user = Authentication.fromJson(jsonDecode(g.read("user")));
  final EquiposProvider equiposProvider = GetInstance().find<EquiposProvider>();

  RxInt position = 0.obs;

  final RxList<Equipos> _equipos = <Equipos>[].obs;
  RxList<Equipos> get equipos => this._equipos;
  set equipos(value) => this._equipos.value = value;

  final count = 0.obs;
  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    if (user.user!.equipoId == null) {
      change(null, status: RxStatus.error("Error"));
    } else {
      final value = await equiposProvider.getRanking("positions", user.user?.equipo?.id ?? 0);
      equipos = value["ranking"];
      position.value =
          value["miPosicion"] ?? 0; // <- Aquí se asigna correctamente
    }
    change(null, status: RxStatus.success());

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
