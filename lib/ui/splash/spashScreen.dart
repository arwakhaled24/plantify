import 'package:flutter/material.dart';
import 'package:plantify/ui/onboardin/onboarding.dart';

@override
class SplashScreen extends StatelessWidget {
  static const String routeName = "splash screen ";
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, OnBoarding.routeName);
      },
    );
    return Scaffold(
      body: Image.asset(
        "assets/images/Splash.png",
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
