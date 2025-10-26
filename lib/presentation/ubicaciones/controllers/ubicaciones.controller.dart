import 'package:get/get.dart';
import 'package:sustaina/infrastructure/models/providers/users.provider.dart';
import 'package:sustaina/infrastructure/models/users.dart';

class UbicacionesController extends GetxController with StateMixin<List<User>> {
  //TODO: Implement UbicacionesController
  final UsersProvider usersProvider = GetInstance().find<UsersProvider>();

  final count = 0.obs;
  @override
  void onInit() async {
    change(null, status: RxStatus.loading());
    try {
      await usersProvider.getReceptores("receptoresGlobales").then(
        (value) {
          try {
            change(value["receptores"], status: RxStatus.success());
          } catch (e) {
            change(null, status: RxStatus.error("$e"));
          }
        },
      );
    } catch (e) {}
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
