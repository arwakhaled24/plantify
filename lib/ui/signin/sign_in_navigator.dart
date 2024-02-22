import 'package:flutter/material.dart';

abstract class SignInNavigator {
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
