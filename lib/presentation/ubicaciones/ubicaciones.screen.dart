import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UbicacionesController extends GetxController {
  var selectedTabIndex = 0.obs;
}

class UbicacionesScreen extends GetView<UbicacionesController> {
  const UbicacionesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final widgets = [
      const Center(child: Text('Marker Screen')),
      const Center(child: Text('Directions Screen')),
    ];

    return Obx(() => Scaffold(
          body: widgets[controller.selectedTabIndex.value],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedTabIndex.value,
            onTap: (newIndex) =>
                controller.selectedTabIndex.value = newIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.pin_drop),
                label: 'Marker',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions),
                label: 'Directions',
              ),
            ],
          ),
        ));
  }
}
