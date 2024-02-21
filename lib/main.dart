import 'package:flutter/material.dart';
import 'package:plantify/ui/home/Home.dart';
import 'package:plantify/ui/login/sign_in_screen.dart';
import 'package:plantify/ui/onboardin/onboarding.dart';
import 'package:plantify/ui/splash/spashScreen.dart';
import 'package:plantify/ui/theme.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PLantify',
      debugShowCheckedModeBanner: false,
      theme:AppTheme.theme,
      initialRoute:  SignInScreen.routeName,
      routes: {
        SplashScreen.routeName : (context)=>SplashScreen(),
        SignInScreen.routeName : (context)=>SignInScreen(),
        OnBoarding.routeName :(context)=>OnBoarding(),
        HomeScreen.routeName :(context)=>HomeScreen()

      },


    );
  }
}