import '../../data/model/respose/Signing_respond.dart';

abstract class AuthDataSource {
  Future<SigningRespond> signInWithEmailAndPassword(String email, String password);
  Future<SigningRespond> signUpWithEmailAndPassword(String name, String email, String phone, String password);

 /* Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signInWithApple();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getUser();*/
}
