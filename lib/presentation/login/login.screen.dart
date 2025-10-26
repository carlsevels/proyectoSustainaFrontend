import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Bienvenido, Login",
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  "Reciclar es un hábito, y los hábitos son la base de la responsabilidad financiera.",
                ),
                SizedBox(height: 48.0),
                TextFormField(
                  controller: controller.user.email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Email"),
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: controller.user.password,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Password"),
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
                SizedBox(height: 8.0),
                SizedBox(
                  width: Get.size.width,
                  child: FilledButton(
                    onPressed: () {
                      loginController.login();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(5),
                      ),
                      fixedSize: const Size(30, 30),
                    ),
                    child: Text("Entrar"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("¿Nuevo usuario?"),
                SizedBox(width: 8.0),
                InkWell(onTap: () {}, child: Text("Registrate aqui")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
