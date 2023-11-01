import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:todoapp/constants/textStyles.dart';
import 'package:get/get.dart';

final width = (ui.window.physicalSize.width / ui.window.devicePixelRatio);
final height = (ui.window.physicalSize.height / ui.window.devicePixelRatio);
var defaultPadding = width * 0.047;
SizedBox defaultSpace = SizedBox(
  width: width * 0.047,
);
SizedBox defaultpadding = SizedBox(
  height: 30,
);
bool isTapped = false;

loginButton(String text, Gradient btnColor, Color shadowColor, double width) {
  return Container(
    width: width,
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: shadowColor, blurRadius: 10,
        offset: Offset(0, 0), // Shadow position [horizontal, vertical]
        // Spread or blur of the shadow
        spreadRadius: 1,
      ),
    ], gradient: btnColor, borderRadius: BorderRadius.circular(15)),
    child: Center(child: Text(text, style: btnTextStyle1)),
  );
}

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.bgColor,
      required this.textEditingController,
      required this.hintText,
      required this.label,
      required this.obscureText,
      required this.shadowColor});

  LinearGradient bgColor;
  TextEditingController textEditingController;
  Color shadowColor;
  bool obscureText;
  String label;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: shadowColor, blurRadius: 10,
          offset: Offset(0, 0), // Shadow position [horizontal, vertical]
          // Spread or blur of the shadow
          spreadRadius: 1,
        ),
      ], gradient: bgColor, borderRadius: BorderRadius.circular(15)),
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        onChanged: (value) {
          print("Entered Text: $value");
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
          hintStyle: TextStyle(color: Colors.white),
          hintText: hintText,
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2); // Start from the center-left side
    path.quadraticBezierTo(size.width * 0.3, size.height, size.width,
        size.height * 0.8); // Curve towards the bottom-right
    path.lineTo(size.width, 0); // End at the center-right side
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ReverseClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height / 2); // Start from the bottom-left
    path.quadraticBezierTo(size.width * 0.3, size.height * 0.8, size.width,
        size.height * 0.3); // Curve towards the center-right at the bottom
    path.lineTo(size.width, 0); // End at the top-right
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
