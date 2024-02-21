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
  Future<SigningRespond> signUpWithEmailAndPassword(String email, String password,String name, String phone) {
    return authDataSourceRepository.signUpWithEmailAndPassword(email, password,name, phone);
  }



}