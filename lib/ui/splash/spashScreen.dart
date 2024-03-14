import 'package:flutter/material.dart';

import '../onboardin/onboarding.dart';
@override
class SplashScreen extends StatelessWidget {
  static const String routeName = "splash screen ";

  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 2),
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
