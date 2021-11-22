import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;

      return user;
    } catch (eror) {
      print(eror.toString());
      return null;
    }
  }

  static Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      return user;
    } catch (eror) {
      print(eror.toString());
      return null;
    }
  }

  static Future<void> signOut() async {
    _auth.signOut();
  }

  static Stream<User?> get userStream => _auth.authStateChanges();
}
