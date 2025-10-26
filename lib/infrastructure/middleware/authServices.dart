import 'package:get/get.dart';
import 'package:sustaina/infrastructure/models/users.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  final RxBool isLogin = false.obs;
  final RxInt rolId = 0.obs;
  final Rx<Roles> rol = Roles().obs;
  final RxString currentRoute = "".obs;

  Future setLogin(bool newValue) async {
    isLogin.value = newValue;
  }

  Future setRol(int newValue) async {
    rolId.value = newValue;
  }

  Future setRoles(Roles newValue) async {
    rol.value = newValue;
  }

  Future setCurrentRoute(String route) async {
    currentRoute.value = route;
  }
}