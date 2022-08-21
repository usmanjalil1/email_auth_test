import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'AuthController.dart';
import 'package:get/get.dart';
import 'LoginScreen.dart';
import 'TextField.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.white,
        body: VxBox(
            child: VStack([
          50.heightBox,
          "Register Yourself".text.orange500.xl3.bold.makeCentered(),
          25.heightBox,
          TextFeild(
            controller: email,
            placeholdertext: "Email..",
          ).px(20),
          25.heightBox,
          TextFeild(
            controller: password,
            placeholdertext: "Password",
            isObscure: true,
          ).px(20),
          20.heightBox,
          GestureDetector(
            onTap: () => controller.register(email.text, password.text),
            child: VxBox(
                child: Center(
              child: "Register".text.white.bold.make(),
            )).size(150, 50).orange500.rounded.makeCentered(),
          ),
          10.heightBox,
          HStack([
            "Have an Account ?"
                .text
                .black
                .textStyle(context.captionStyle)
                .make(),
            5.widthBox,
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen())),
              child: "Login"
                  .text
                  .blue600
                  .underline
                  .textStyle(context.captionStyle)
                  .make(),
            )
          ]).centered()
        ])).square(400).makeCentered());
  }
}
