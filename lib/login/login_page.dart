import 'package:flutter/material.dart';

import 'package:todoapp/constants/geometry.dart';

import '../constants/colors.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
          width: width,
          height: height,
          child: Column(children: [
            ClipPath(
              clipper: MyClipper(),
              child: SizedBox(
                height: height * 0.60,
                width: width,
                child: Image.asset(
                  "assets/images/sign-up.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                    defaultpadding,
                    CustomTextField(
                      bgColor: signUpBtnColor,
                      textEditingController: emailController,
                      shadowColor: shadowColor2,
                      obscureText: false,
                      label: 'Email',
                      hintText: 'Enter Your Email',
                    ),
                    defaultpadding,
                    CustomTextField(
                      obscureText: true,
                      bgColor: signUpBtnColor,
                      textEditingController: passwordController,
                      label: 'Password',
                      hintText: 'Enter Your Password',
                      shadowColor: shadowColor2,
                    ),
                    defaultpadding,
                    loginButton("Sign In", signInBtnColor, shadowColor1, width)
                  ]),
            )
          ])),
    ));
  }
}


//this commit include this
// Initializing variables
// Widget for the user profile
// Function to validate email input
// Function to validate password input
// Function to validate the form
// Function to login the user
// Widget for the login page
// Widget for the sign up page

// import 'package:flutter/material.dart';


