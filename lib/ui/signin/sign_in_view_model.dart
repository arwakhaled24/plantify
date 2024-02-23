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
      navigator.ShowLoading("loading ");
      var response = await authRepostory.signInWithEmailAndPassword(email, password);
      if(response.displayName!=null){
        navigator.HideLoading();
        navigator.NavigateToHomeScreen();

      }
      else{
        navigator.HideLoading();
        navigator.ShowLoading(response.message??"");
        print(response.statusCode);
      }
    }catch(e){
      // hide lodaing
      navigator.HideLoading();
      // show (e)
      navigator.ShowMessage(e.toString());
    }

  }










}