import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../models/user_profile_model.dart';

class RegistrationRepository {
  // Function to register a user
  Future<UserModel> registerUser(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Add user details to Firebase Firestore
      // TODO: Do we actually need this user model as we have user profile and all the data are in it.
      // TODO: we are not using any of the data from user model
      // TODO : lets keep it for now, later if its not of use we can remove it
      final userModel = UserModel(
        isNewUser: true,
        email: userCredential.user?.email ?? '',
        isEmailVerified: userCredential.user?.emailVerified ?? false,
        creationTime:
            userCredential.user?.metadata.creationTime ?? DateTime.now(),
        lastSignInTime:
            userCredential.user?.metadata.lastSignInTime ?? DateTime.now(),
        profile: {},
        displayName: userCredential.user?.displayName ?? '',
        phoneNumber: userCredential.user?.phoneNumber ?? '',
        photoURL: userCredential.user?.photoURL ?? '',
        providerId: userCredential.additionalUserInfo?.providerId ?? '',
        uid: userCredential.user?.uid ?? '',
        refreshToken: userCredential.user?.refreshToken ?? '',
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user?.uid)
          .set(userModel.toJson());
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
