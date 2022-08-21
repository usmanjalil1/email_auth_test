import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TextFeild extends StatelessWidget {
  final String placeholdertext;
  final bool isObscure;
  final TextEditingController controller;
  TextFeild(
      {Key? key,
      required this.placeholdertext,
      this.isObscure = false,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: CupertinoTextField(
        controller: controller,
        decoration: BoxDecoration(
          color: Vx.gray400,
          borderRadius: BorderRadius.circular(10),
        ),
        placeholder: placeholdertext,
        placeholderStyle: TextStyle(color: Vx.white),
        style: TextStyle(color: Vx.black),
        obscureText: isObscure,
      ),
    );
  }
}
