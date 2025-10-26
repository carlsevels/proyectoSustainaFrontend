import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sustaina/infrastructure/middleware/authServices.dart';
import 'package:sustaina/infrastructure/models/authentications.model.dart';
import 'package:sustaina/infrastructure/models/modelsForms/users.model.dart';
import 'package:sustaina/infrastructure/navigation/routes.dart';
import 'package:sustaina/presentation/login/providers/login.provider.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  RxBool isLoading = false.obs;
  final LoginProvider _apiLogin = GetInstance().find<LoginProvider>();

  final user = UsersTextControllerModel(
      email: TextEditingController(text: ""),
      password: TextEditingController(text: ""));

  final _isObscure = true.obs;
  bool get isObscure => _isObscure.value;
  set isObscure(bool value) => _isObscure.value = value;


  final count = 0.obs;
  @override
  void onInit() {
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

  Future<void> login() async {
    Map authentication = {
      "strategy": "local",
      "email": user.email!.text,
      "password": user.password!.text,
    };

    try {
      isLoading.value = true;
      // Realiza la solicitud de login al backend
      Response response = await _apiLogin.login(authentication, "login");

      if (response.statusCode == 201) {
        Map<String, dynamic> body = (response.body);
        Authentication userlogin = Authentication.fromJson(body);

        // Almacena la información del usuario en GetStorage
        GetStorage g = GetStorage('xn1');
        await g.write('isLogin', true);
        await g.write("user", jsonEncode(userlogin.toJson()));

        // Actualiza el estado reactivo del servicio de autenticación
        final authService = Get.find<AuthService>();
        authService.setLogin(true);

        // Limpia los campos de login
        user.email!.clear();
        user.password!.clear();

        print("Login: ${jsonEncode(userlogin)} ");
        Get.offAndToNamed(Routes.HOME);
      } else {
        isLoading.value = false;
        Map body = response.body;

        Get.defaultDialog(
          radius: 5,
          contentPadding: EdgeInsets.all(20),
          title: body["code"] == 401
              ? "Email o contraseña incorrecta"
              : "Código: " + body["code"],
          content: Row(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: 200,
                  height: 500,
                  child: SingleChildScrollView(
                    child: Text(body["code"] == 401
                        ? "Favor de colocar correctamente su email o contraseña"
                        : "Mensaje: ${body['message']}"),
                  ),
                ),
              )
            ],
          ),
          confirm: ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Aceptar"),
          ),
        );
      }
    } catch (e) {
      isLoading.value = false;
      print("Error de conexión o inesperado: $e");
      Get.defaultDialog(
        title: "Errro",
        middleText:
            "Hubo un error al intentar conectarse al servidor. Por favor, inténtalo de nuevo.",
        confirm: ElevatedButton(
          onPressed: () => Get.back(),
          child: Text("Aceptar"),
        ),
      );
    }
  }

  void increment() => count.value++;
}
