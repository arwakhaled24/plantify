import 'package:flutter/material.dart';

abstract class SignUpNavigator{
  void ShowMessage(
      String message, {
        String? posActionTitle,
        VoidCallback? posAction,
        String? negActionTitle,
        VoidCallback? negAction,
        bool isDissMissable = true,
      });
  void ShowLoading(String text);
  void HideLoading();
  void NavigateToHomeScreen();
}
