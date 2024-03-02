
import 'package:flutter/material.dart';
import 'package:plantify/data/dataScource/auth_data_scource.dart';
import 'package:plantify/data/repository/auth_repo_imp.dart';
import 'package:plantify/domain/dataSource/auth_data_scource.dart';
import 'package:plantify/domain/repository/auth_repository.dart';
import 'package:plantify/ui/sign_up/sign_up_navigator.dart';
import '../../data/api/api_manager.dart';
class SignUpViewModel extends ChangeNotifier{
  late  SignUpNavigator navigator ;
 late  ApiManager apiManager = ApiManager();
 late  AuthDataSource onlineDatASource= AuthDataScourceImp(apiManager);
 late AuthRepository authRepostory = AuthRepositoryImp(onlineDatASource);
  void SignUp(String name, String password ,String phone, String email  )async{
    try{
      navigator.ShowLoading("loading ");
      var response = await authRepostory.signUpWithEmailAndPassword(name, password, phone, email);
      if(response.message!=null){
        navigator.HideLoading();
        navigator.ShowMessage(response.message??"");
        print(response.message);
      }
      else if(response.displayName!=null){
        navigator.HideLoading();
        navigator.NavigateToHomeScreen();
      }
    }catch(e){
      // hide lodaing
      navigator.HideLoading();
      // show (e)
      navigator.ShowMessage(e.toString());
    }

  }










}