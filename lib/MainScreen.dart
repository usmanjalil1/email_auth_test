import 'package:email_auth_test/AuthController.dart';

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: VStack([
          80.heightBox,
          GestureDetector(
            onTap: () => controller.SignOut(),
            child: ListTile(
              title: "Sign Out".text.black.xl.make(),
              leading: Icon(
                Icons.logout_rounded,
                color: Vx.black,
              ),
            ),
          )
        ]),
      ),
      appBar: AppBar(
        title: "Home Screen".text.white.make(),
        centerTitle: true,
        backgroundColor: Vx.orange500,
        elevation: 0.0,
      ),
      body: Center(
          child:
              "This Demo App is for demonstrating FCM (FireBase Cloud Messaging)"
                  .text
                  .black
                  .make()
                  .px(10)),
    );
  }
}
