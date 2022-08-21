import 'package:email_auth_test/AuthController.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'RegisterScreen.dart';
import 'TextField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  AuthController controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.white,
        body: VxBox(
            child: VStack([
          50.heightBox,
          "Login".text.orange500.xl3.bold.makeCentered(),
          25.heightBox,
          TextFeild(
            controller: emailController,
            placeholdertext: "Email..",
          ).px(20),
          25.heightBox,
          TextFeild(
            controller: PasswordController,
            placeholdertext: "Password",
            isObscure: true,
          ).px(20),
          20.heightBox,
          GestureDetector(
            onTap: () =>
                controller.login(emailController.text, PasswordController.text),
            child: VxBox(
                child: Center(
              child: "Login".text.white.bold.make(),
            )).size(150, 50).orange500.rounded.makeCentered(),
          ),
          10.heightBox,
          HStack([
            "Don't have an Account ?"
                .text
                .black
                .textStyle(context.captionStyle)
                .make(),
            5.widthBox,
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen())),
              child: "Register yourself"
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
