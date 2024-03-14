import 'package:flutter/material.dart';

import '../theme.dart';


class DialogScreen {
  static void showprogresDialog(context, String? text,
      {bool dismissable = false}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(children: [
              CircularProgressIndicator(color: Theme.of(context).primaryColor),
              Text(
                text ?? "",
                style: TextStyle(
                    color: AppTheme.darkText,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400),
              )
            ]),
          );
        },
        barrierDismissible: dismissable);
  }

  static  void showmessage(context, String message){
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(children: [
              Text(
                message ?? "",
                style: TextStyle(
                    color: AppTheme.green_2,
                    fontSize: 16,
                    debugLabel: "Poppins",
                    fontWeight: FontWeight.w400),
              )
            ]),
          );
        },
        barrierDismissible: true);
  }
  static void hideDialog (context){
    Navigator.pop(context);
  }
}
