import 'package:flutter/material.dart';
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
  @override
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
                height: hight * .3,
                width: width * .5,
                child: Text(
                  header??"",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontFamily: "Poppins",

                      fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                child: Text(
                  content??"",
                  style: const TextStyle(
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
