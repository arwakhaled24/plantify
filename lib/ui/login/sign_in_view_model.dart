
import 'package:flutter/material.dart';
import 'package:plantify/ui/login/sign_in_navigator.dart';
import '../../api/api_manager.dart';
class SignInViewModel extends ChangeNotifier{
  late  SignInNavigator navigator ;
  void signin(String email, String password)async{

    try{
      // show loading
      navigator.ShowLoading("loading ");
      var response = await ApiManager.sign_in(email, password);
      if(response.statusCode!=null){
        // hide loading
        navigator.HideLoading();
        // navigate to homescreen :
        navigator.NavigateToHomeScreen();
        // show message for now
        navigator.ShowLoading(response.message??"");
      }
      else{
        // hide loading
        //hideloding
        navigator.NavigateToHomeScreen();
       // navigator.hideLoading();
        // show response.statusMsg


        navigator.ShowLoading(response.message??"");

      }

    }catch(e){
      // hide lodaing
      navigator.HideLoading();
      // show (e)
      navigator.ShowMessage(e.toString());
    }

  }










}