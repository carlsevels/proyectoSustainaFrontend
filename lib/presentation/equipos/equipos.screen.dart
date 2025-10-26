import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/equipos.controller.dart';

class EquiposScreen extends GetView<EquiposController> {
  const EquiposScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      onError: (error) => const Center(
        child: Text(
          "No hay EQUIPO ASIGNADO",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      (state) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  controller.user.user!.equipo!.detalleEquipo!.portada!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: Get.size.width / 8,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.network(
                        controller.user.user!.equipo!.detalleEquipo!.logo!,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.broken_image,
                                size: 50, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(top: 45),
                child: Column(
                  children: [
                    Text(controller
                            .user.user?.equipo?.detalleEquipo?.descripcion ??
                        ""),
                    Text(
                      'Ranking',
                      textScaleFactor: 1.5,
                    ),
                    Text("Mi Posicion: ${controller.position.value}"),
                    Text(
                      "${controller.user.user?.equipo?.detalleEquipo?.puntos} puntos" ??
                          "0",
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(
                    width: Get.size.width,
                    height: Get.size.height - 386,
                    child: DefaultTabController(
                      initialIndex: 1,
                      length: 2,
                      child: Scaffold(
                        appBar: AppBar(
                          centerTitle: false,
                          automaticallyImplyLeading: false,
                          title: Text("Ranking"),
                          bottom: const TabBar(
                            tabs: <Widget>[
                              Tab(icon: Icon(Icons.map_sharp)),
                              Tab(icon: Icon(Icons.location_city_outlined)),
                            ],
                          ),
                        ),
                        body: TabBarView(
                          children: <Widget>[
                            Center(
                                child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Global",
                                    textScaleFactor: 1.5,
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  SingleChildScrollView(
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) {
                                        return Divider();
                                      },
                                      shrinkWrap: true,
                                      itemCount: controller.equipos.length,
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            CircleAvatar(
                                              child: Text("${index + 1}"),
                                            ),
                                            SizedBox(
                                              width: 8.0,
                                            ),
                                            Expanded(
                                              child: Text(controller
                                                      .equipos[index].nombre ??
                                                  ""),
                                            ),
                                            Text(
                                                "${controller.equipos[index].detalleEquipo?.puntos.toString()} puntos" ??
                                                    "")
                                          ],
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            )),
                            Center(child: Text("It's rainy here")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: Get.size.width,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text("Aportar"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(5),
                        ),
                        fixedSize: const Size(30, 30),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
