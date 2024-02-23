import 'package:flutter/material.dart';
import 'package:plantify/ui/theme.dart';

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

  static  void showmessage(context, String message, {String? posActionTitle,
    VoidCallback? posAction,
    String? negActionTitle,
    VoidCallback? negAction,
    bool isDissMissable = true,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        List<Widget> actions = [];
        if (posActionTitle != null) {
          actions.add(TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (posAction != null) {
                posAction();
              }
            },
            child: Text(
              posActionTitle ?? "",
              style: TextStyle(
                color: AppTheme.darkText,
                fontFamily: "Poppins",
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ));
        }

        if (negAction != null) {
          actions.add(TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (negAction != null) {
                negAction();
              }
            },
            child: Text(
              negActionTitle ?? "",
              style: TextStyle(
                color:  AppTheme.darkText,
                fontSize: 18,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500,
              ),
            ),
          ));
        }
        return AlertDialog(
          content: Text(message,style: TextStyle(
              color:  AppTheme.darkText,
              fontSize: 16,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400),),
          actions: actions,
        );
      },
    );
  }
  static void hideDialog (context){
    Navigator.pop(context);
  }
}
