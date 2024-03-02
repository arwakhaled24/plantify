import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class OnboardingWidget extends StatelessWidget {
  String imagePath;
  String header;
String content;
  ElevatedButton? button;
  OnboardingWidget({
    required this.imagePath,
    this.header = "",
    this.content = "",
    this.button  ,
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
              Expanded(child: Image.asset("assets/images/background_onboarding.png", width: double.infinity, fit: BoxFit.fitWidth)),
              Positioned(
                child: Text(
                  header??"",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: "Poppins",

                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
                height: hight * .3,
                width: width * .5,
              ),
              Positioned(
                child: Text(
                  content??"",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center
                ),
                height: hight * .07,
                width: width * .8,
              ),

                if(button != null)
                SizedBox(
                  child: button,
                  width: width * .8,
                  height: hight * .08,
                )
            ,



            ],
          )
        ],
      ),
    );
  }
}
