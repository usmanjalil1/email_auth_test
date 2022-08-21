import 'package:email_auth_test/AuthController.dart';
import 'package:flutter/material.dart';
import 'TextField.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

class NumberAuth extends StatelessWidget {
  NumberAuth({Key? key}) : super(key: key);
  TextEditingController number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.white,
        body: VxBox(
            child: VStack([
          50.heightBox,
          "Login".text.orange500.xl3.bold.makeCentered(),
          25.heightBox,
          ListTile(
            leading: "+92".text.xl.black.make(),
            title: TextField(
              controller: number,
              keyboardType: TextInputType.number,
            ),
          ),
          20.heightBox,
          GestureDetector(
            onTap: () =>
                Get.find<AuthController>().verifyPhoneNumber(number.text),
            child: VxBox(
                child: Center(
              child: "Register with Number".text.white.bold.make(),
            )).size(150, 50).orange500.rounded.makeCentered(),
          ),
          10.heightBox,
        ])).square(400).makeCentered());
  }
}
