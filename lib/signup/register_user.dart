import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todoapp/constants/geometry.dart';

import '../constants/colors.dart';
import '../firebase_functions.dart';

class RegistereUser extends StatelessWidget {
  const RegistereUser({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        ClipPath(
          clipper: MyClipper(),
          child: SizedBox(
            width: width,
            height: height * 0.40,
            child: Image.asset(
              "assets/images/sign-in.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Signup",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.w900),
            ),
            defaultpadding,
            CustomTextField(
              bgColor: signInBtnColor,
              textEditingController: nameController,
              shadowColor: shadowColor1,
              label: 'Name',
              hintText: 'Enter Your Name',
              obscureText: false,
            ),
            defaultpadding,
            CustomTextField(
              bgColor: signInBtnColor,
              textEditingController: emailController,
              shadowColor: shadowColor1,
              label: 'Email',
              hintText: 'Enter Your Email',
              obscureText: false,
            ),
            defaultpadding,
            CustomTextField(
                bgColor: signInBtnColor,
                textEditingController: passwordController,
                label: 'Password',
                hintText: 'Enter Your Password',
                shadowColor: shadowColor1,
                obscureText: true),
            defaultpadding,
            CustomTextField(
                bgColor: signInBtnColor,
                textEditingController: confirmPasswordController,
                shadowColor: shadowColor1,
                label: 'Confirm Password',
                hintText: 'Enter Password Again',
                obscureText: true),
            defaultpadding,
            GestureDetector(
              onTap: () {
                print("+++++++++++++++++++++++++" + emailController.text);
                print("+++++++++++++++++++++++++" + passwordController.text);
                print("+++++++++++++++++++++++++" +
                    confirmPasswordController.text);
                print("+++++++++++++++++++++++++" + nameController.text);
                createUserWithEmailAndPassword(
                    emailController.text, passwordController.text);
                Fluttertoast.showToast(msg: "Registeration Successful");
              },
              child:
                  loginButton("Sign up", signUpBtnColor, shadowColor2, width),
            )
          ]),
        )
      ]),
    ));
  }
}
