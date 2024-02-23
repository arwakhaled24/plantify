import 'package:flutter/material.dart';
import 'package:plantify/ui/signin/sign_in_navigator.dart';
import '../../data/api/api_manager.dart';
import '../../data/dataScource/auth_data_scource.dart';
import '../../data/repository/auth_repo_imp.dart';
import '../../domain/dataSource/auth_data_scource.dart';
import '../../domain/repository/auth_repository.dart';
class SignInViewModel extends ChangeNotifier{
  late  SignInNavigator navigator ;
  late  ApiManager apiManager = ApiManager();
  late  AuthDataSource onlineDatASource= AuthDataScourceImp(apiManager);
  late AuthRepository authRepostory = AuthRepositoryImp(onlineDatASource);
  void signin(String email, String password)async{
    try{
      // show loading
      //navigator.ShowLoading("loading ");
      var response = await authRepostory.signInWithEmailAndPassword(email, password);
      if(response.statusCode!=null){
        // hide loading
        navigator.HideLoading();
        // navigate to homescreen :
        navigator.NavigateToHomeScreen();
        // show message for now
        navigator.ShowLoading(response.message??"");
      }
      else{
        navigator.HideLoading();
        navigator.NavigateToHomeScreen();
        //navigator.ShowLoading(response.message??"");
      }
    }catch(e){
      // hide lodaing
      navigator.HideLoading();
      // show (e)
      navigator.ShowMessage(e.toString());
    }

  }










}