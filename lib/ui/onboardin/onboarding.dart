import 'package:flutter/material.dart';
import 'package:plantify/ui/login/loginscreen.dart';

class OnBoarding extends StatelessWidget {
  static const String routeName = "first onboarding";
  final controller = PageController();
  @override
  List onboardingImages = [
    "assets/images/plant_icon.png",
    "assets/images/onboarding2.png",
    "assets/images/onboardin3.png",
    "assets/images/logo_vertivcal.png"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      /*body: PageView.builder(  itemCount: onboardingImages.lenght,
        itemBuilder: (context , index ){
          Column(
            children: [
              Expanded(child: Image.asset(onboardingImages[index])),
              Expanded(child: Image.asset("assets/images/background_onboarding.png")
            ],
          );

        }),*/
      body: PageView(

        children: [
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  onboardingImages[0],
                )),
                Stack(
                  children: [
                    Expanded(
                        child: Image.asset(
                            "assets/images/background_onboarding.png",
                            width: double.infinity,
                            fit: BoxFit.fitWidth)),
                    Text(
                      "Treatment Reccomendation",
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: Colors.white,
            child: Column(
              children: [

                Expanded(
                    child: Image.asset(
                  onboardingImages[1],
                )),
                Stack(
                  children: [
                    Expanded(
                        child: Image.asset(
                            "assets/images/background_onboarding.png",
                            width: double.infinity,
                            fit: BoxFit.fitWidth)),
                    Text(
                      "Treatment Reccomendation",
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  onboardingImages[2],
                )),
                Stack(
                  children: [
                    Expanded(
                        child: Image.asset(
                            "assets/images/background_onboarding.png",
                            width: double.infinity,
                            fit: BoxFit.fitWidth)),
                    Text(
                      "Treatment Reccomendation",
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                    child: Image.asset(
                  "assets/images/logo_vertivcal.png",
                )),
                Stack(
                  children: [
                    Expanded(
                        child: Image.asset(
                            "assets/images/background_onboarding.png",
                            width: double.infinity,
                            fit: BoxFit.fitWidth)),
                    ElevatedButton(onPressed:(){ Navigator.pushReplacementNamed(context, LogInScreen.routeName);},
                        child: Text("bbb"))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
