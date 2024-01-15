import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  // Function to register a user
  Future<UserCredential?> registerUser(String email, String password) async {
    try {
       final user = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password));
      print('Registration successful: $user');
      return user;
    } catch (e) {
      rethrow;
    }
  }

  // Function to sign in a user
  Future<UserCredential?> signInUser(String email, String password) async {
    try {
      final credentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print('Sign-in successful: ${credentials.user?.uid}');
      return credentials;
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<void> signOut()async {
    await FirebaseAuth.instance.signOut();
  }

  // Function to handle FirebaseAuthException
  void handleAuthException(dynamic e) {
    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print('Authentication error: ${e.code}');
      }
    } else {
      print('Authentication error: $e');
    }
  }
}
