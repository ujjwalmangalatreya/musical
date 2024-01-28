import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {

  // Function to sign in a user
  Future<UserCredential?> signInUser(String email, String password) async {
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credentials;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut()async {
    await FirebaseAuth.instance.signOut();
  }

  // Function to handle FirebaseAuthException

}
