import 'package:email_auth_test/AuthController.dart';
import 'package:email_auth_test/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);
  TextEditingController otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Vx.white,
        body: VxBox(
            child: VStack([
          50.heightBox,
          "Enter OTP".text.orange500.xl3.bold.makeCentered(),
          25.heightBox,
          ListTile(
            title: TextField(
              controller: otp,
              keyboardType: TextInputType.number,
            ),
          ),
          20.heightBox,
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance
                  .signInWithCredential(PhoneAuthProvider.credential(
                      verificationId: Get.find<AuthController>().VerificationId,
                      smsCode: otp.text))
                  .then((value) async {
                if (value.user != null) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                      (route) => false);
                }
              });
            },
            child: VxBox(
                child: Center(
              child: "Register".text.white.bold.make(),
            )).size(150, 50).orange500.rounded.makeCentered(),
          ),
          10.heightBox,
        ])).square(400).makeCentered());
  }
}
