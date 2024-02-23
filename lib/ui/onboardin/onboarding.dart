import 'package:flutter/material.dart';
import 'package:plantify/ui/custom_widget/onboardind_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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

  OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(children: [
        PageView(
          controller: controller,
          children: [
            OnboardingWidget(
              imagePath: onboardingImages[0],
              header: "Plant Identification", content: "snap a photo, and let us unveil the secrets of nature at your fingertips",
            ),
            OnboardingWidget(imagePath: onboardingImages[1],header: "Disease Detection",content: "just capture a photo, and we'll analyze it to help you proactively identify and address potential plant health concerns",),
            OnboardingWidget(imagePath: onboardingImages[2],header: "Recomend Treatment",content: "ensuring you receive the most effective and personalized wellness guidance",),
            OnboardingWidget(imagePath: "assets/images/logo_vertivcal.png")
          ],
        ),
        Container(
          alignment: const Alignment(0,.8),
            child: SmoothPageIndicator(controller: controller, count: onboardingImages.length,effect: const SwapEffect(
              dotHeight: 10,
              dotWidth: 10,
              dotColor: Colors.white,
              activeDotColor: Colors.white60,

            ),))

      ]),
    );
  }
}
