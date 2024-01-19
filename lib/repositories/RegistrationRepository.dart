import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musical_mingle/models/registraion_model.dart';

class RegistrationRepository {
  // Function to register a user
  Future<RegistrationModel> registerUser(String email, String password) async {
    try {
      final userCredential = (await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password));

      final userData = RegistrationModel(
        id: userCredential.user!.uid,
        email: userCredential.user?.email,
        displayName: userCredential.user?.displayName,
        pictureUrl: userCredential.user?.displayName,
      );
      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid)
          .set(userData.toJson());
      return userData;
    } catch (e) {
      rethrow;
    }
  }
}
