import 'package:plantify/data/model/respose/Signing_respond.dart';

abstract class AuthRepository {
  Future<SigningRespond> signInWithEmailAndPassword(String email, String password);
  Future<SigningRespond> signUpWithEmailAndPassword(String name, String password ,String phone, String email);

 /* Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signInWithApple();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getUser();*/
}
