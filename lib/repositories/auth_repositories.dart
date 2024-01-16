import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musical_mingle/models/user_model.dart';

class AuthRepository {
  // Function to register a user
  Future<UserCredential> registerUser(String email, String password) async {
    try {
       final userCredential = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password));
      // Add user details to firebase firestore
       final userData = UserModel(
           id: userCredential.user!.uid,
           email: userCredential.user?.email,
           displayName: userCredential.user?.displayName,
           pictureUrl: userCredential.user?.displayName,
       );
       await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid)
           .set(userData.toJson());
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

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
