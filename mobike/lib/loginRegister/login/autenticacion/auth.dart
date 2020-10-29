import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

class AutenticacionServicio {
  final FirebaseAuth _firebaseAuth;

  AutenticacionServicio(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Se inicio sesion correctamente";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
