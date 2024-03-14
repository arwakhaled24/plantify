

import '../../domain/dataSource/auth_data_scource.dart';
import '../../domain/repository/auth_repository.dart';
import '../model/respose/Signing_respond.dart';

class AuthRepositoryImp implements AuthRepository {
   AuthDataSource authDataSourceRepository;

  AuthRepositoryImp(this.authDataSourceRepository);

  @override
  Future<SigningRespond> signInWithEmailAndPassword(String email, String password) {
    return authDataSourceRepository.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<SigningRespond> signUpWithEmailAndPassword(String name, String password ,String phone, String email) {
    return authDataSourceRepository.signUpWithEmailAndPassword(name, password,phone, email);
  }



}