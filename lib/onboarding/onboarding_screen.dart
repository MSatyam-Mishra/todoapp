import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/login/login_page.dart';

import '../constants/geometry.dart';
import '../constants/textStyles.dart';
import 'package:get/get.dart';

import '../signup/register_user.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Stack(children: [
          Image.asset(
            "assets/images/onboarding/onboarding-1.png",
            width: width,
          ),
          Positioned(
              top: height * 0.50,
              child: Container(
                height: height * 0.50,
                width: width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: defaultPadding,
                      right: defaultPadding,
                      top: 60,
                      bottom: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start 👍 \nTask & Time \nManagement",
                        style: bigHeading,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          defaultSpace,
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LogInPage())),
                            child: loginButton("Sign In", signInBtnColor,
                                shadowColor1, width * 0.4295 - 18.5),
                          ),
                          defaultSpace,
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegistereUser())),
                            child: loginButton("Sign Up", signUpBtnColor,
                                shadowColor2, width * 0.4295 - 18.5),
                          ),
                          defaultSpace
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
