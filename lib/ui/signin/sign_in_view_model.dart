import 'package:flutter/material.dart';
import 'package:plantify/ui/signin/sign_in_navigator.dart';
import '../../data/api/api_manager.dart';
import '../../data/dataSourceImp/auth_data_scource.dart';
import '../../data/repositoryImp/auth_repo_imp.dart';
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