import 'package:plantify/data/api/api_manager.dart';
import 'package:plantify/data/model/respose/Signing_respond.dart';
import 'package:plantify/domain/dataSource/auth_data_scource.dart';

class AuthDataScourceImp implements AuthDataSource{
  @override
ApiManager apiManager;
  AuthDataScourceImp(this.apiManager);
  Future<SigningRespond> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
  return  ApiManager.signIn(email, password);
  }

  @override
  Future<SigningRespond> signUpWithEmailAndPassword(String name, String password ,String phone, String email) {
    // TODO: implement signUpWithEmailAndPassword
    return ApiManager.SignUp(name, password, phone,email);

  }
  
}