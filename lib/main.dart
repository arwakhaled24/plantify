import 'dart:io';
import 'package:flutter/material.dart';
import 'package:plantify/ui/home/Home.dart';
import 'package:plantify/ui/onboardin/onboarding.dart';
import 'package:plantify/ui/sign_up/sign_up.dart';
import 'package:plantify/ui/signin/sign_in_screen.dart';
import 'package:plantify/ui/splash/spashScreen.dart';
import 'package:plantify/ui/tabs/ChatBotTab/ChatBotTab.dart';
import 'package:plantify/ui/tabs/ChatBotTab/chatBotViewModel.dart';
import 'package:plantify/ui/theme.dart';
import 'package:provider/provider.dart';

import 'di/di.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(_)=> getIt.get<ChatBotViewModel>(),
      child: MaterialApp(
        title: 'PLantify',
        debugShowCheckedModeBanner: false,
        theme:AppTheme.theme,
        initialRoute:  SplashScreen.routeName,
        routes: {
          SplashScreen.routeName : (context)=>SplashScreen(),
          OnBoarding.routeName :(context)=>OnBoarding(),
          HomeScreen.routeName :(context)=>HomeScreen(),
          ChatBotTab.routeName :(context)=>ChatBotTab(),
          SignInScreen.routeName : (context)=>SignInScreen(),
          SignUpScreen.routeName :(context)=>SignUpScreen(),
          // ScanTab.routeName    :(context)=>ScanTab(cameras: value),
        },


      ),
    );
  }
}