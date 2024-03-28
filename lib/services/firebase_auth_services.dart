import 'package:diwe_flutter/pages/auth/widget/classes/user_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error occured");
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var userToken = await credential.user?.getIdToken(true);
      UserModel().token = userToken ?? '';
      return credential.user;
    } catch (e) {
      // Log the error message for better debugging
      print("Error occurred: $e");
      return null;
    }
  }
}
