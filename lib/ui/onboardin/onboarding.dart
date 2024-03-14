import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../custom_widget/onboardind_widget.dart';
import '../sign_up/sign_up.dart';
import '../theme.dart';
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
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        PageView(
          controller: controller,
          children: [
            OnboardingWidget(imagePath: onboardingImages[0], header: "Plant Identification", content: "snap a photo, and let us unveil the secrets of nature at your fingertips",),
            OnboardingWidget(imagePath: onboardingImages[1],header: "Disease Detection",content: "just capture a photo, and we'll analyze it to help you proactively identify and address potential plant health concerns",),
            OnboardingWidget(imagePath: onboardingImages[2],header: "Recomend Treatment",content: "ensuring you receive the most effective and personalized wellness guidance",),
            OnboardingWidget(imagePath: "assets/images/logo_vertivcal.png",
              button:  ElevatedButton(
              onPressed: () {
               Navigator.pushReplacementNamed(context, SignUpScreen.routeName);
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0, // Set elevation as needed
                  padding: EdgeInsets.symmetric(
                      horizontal: 0, vertical: 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  backgroundColor: Colors.transparent),
              child: Container(
                height: hight* .16,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFAEDC81), // Lighter color on one side
                      Color(
                          0xFF6CC51D), // Regular color on the other side
                    ],
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: AppTheme.mainBackground, // Text color
                        fontWeight: FontWeight.bold,

                        fontSize: 18),
                  ),
                ),
              ),
            ),content: "Get Started",
              header: "Get Started",
            )
          ],
        ),
        Container(
          alignment: Alignment(0,.8),
            child: SmoothPageIndicator(controller: controller, count: onboardingImages.length,effect: SwapEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.white,
              activeDotColor: Colors.white60,

            ),))

      ]),
    );
  }
}
