import 'package:flutter/material.dart';

import '../../theme.dart';

class MyStack extends StatelessWidget {
  String text;
  MyStack(this.text);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 60.0,
          height: 40.0,
          margin: EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xffFFFF92), Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      Padding(padding: EdgeInsets.all(18),
      child: Row(
        children: [
          Text(this.text,style: TextStyle(
              color: AppTheme.green_1,
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),),
          Spacer(),
          InkWell(
            child: Text("view all",style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppTheme.green_3,
                fontWeight: FontWeight.bold,
                fontSize: 15
            ),),
          ),

        ],
      )
        ,)],
    );
  }
}
