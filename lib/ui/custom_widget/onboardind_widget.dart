import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class OnboardingWidget extends StatelessWidget {
  String imagePath;
  String? header;
String? content;
  OnboardingWidget({
    required this.imagePath,
    this.header = "",
    this.content = ""
  });
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              imagePath,
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Expanded(
                  child: Image.asset("assets/images/background_onboarding.png",
                      width: double.infinity, fit: BoxFit.fitWidth)),
              Positioned(
                child: Text(
                  header!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                height: hight * .3,
                width: width * .5,
              ),
              Positioned(
                child: Text(
                  content!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center
                ),
                height: hight * .04,
                width: width * .5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
