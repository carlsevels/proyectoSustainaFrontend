import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sustaina/infrastructure/navigation/routes.dart';


class LayoutExterno extends StatelessWidget {
  final Widget? child;
  LayoutExterno({this.child});

  @override
  Widget build(BuildContext context) {
    return Overlay(initialEntries: [
      OverlayEntry(builder: (context) {
        return Scaffold(
          appBar: AppBar(
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Login'),
                  onTap: () async {
                    Get.toNamed(Routes.LOGIN);
                  },
                ),
              ],
            ),
          ),
          body: child,
        );
      })
    ]);
  }
}
