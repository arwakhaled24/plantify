import 'package:flutter/material.dart';

abstract class SignInNavigator {
  void ShowMessage(
    String message, {
    bool isDissMissable = true,
  });
  void ShowLoading(String text);
  void HideLoading();
  void NavigateToHomeScreen();
}
