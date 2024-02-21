import 'package:plantify/data/model/respose/Signing_respond.dart';

abstract class AuthRepository {
  Future<SigningRespond> signInWithEmailAndPassword(String email, String password);
  Future<SigningRespond> signUpWithEmailAndPassword(String email, String password, String name, String phone);

 /* Future<void> signInWithGoogle();
  Future<void> signInWithFacebook();
  Future<void> signInWithApple();
  Future<void> signOut();
  Future<bool> isSignedIn();
  Future<String?> getUser();*/
}
