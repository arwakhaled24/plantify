import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/api/api_manager.dart';
import 'package:plantify/ui/login/cubit/login_state.dart';

class LogInViewModel extends Cubit<LogInViewStates> {
  LogInViewModel() : super(InitialState());
  var apiManager= ApiManager();
  void Sign_in(String email, String Password) async {
    emit(LoadingState());
    try{
      var respond = await apiManager.sign_in(email, Password);
      if (respond.message!=null)
      {
        emit(ErrorState(errorMessagee: "email or password is wrong "));
        return;
      }
      emit(SuccssState("login successfully"));
    }catch(e){
      emit(ErrorState(errorMessagee: e.toString()));
    }


  }
}
