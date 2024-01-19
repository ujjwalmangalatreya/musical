import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserDetailsRepositories {
  // Function to get all user data
  Future<UserModel> getUserDetails(String userId) async {
    try {
      DocumentSnapshot documentSnapshot =
      await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        // Convert the data from Firestore to a UserModel instance
        return UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
      } else {
        // Document does not exist
        return UserModel(
          isNewUser: false,
          email: '',
          isEmailVerified: false,
          creationTime: DateTime.now(),
          lastSignInTime: DateTime.now(),
          profile: null,
          displayName: '',
          phoneNumber: '',
          photoURL: '',
          providerId: '',
          uid: '',
          refreshToken: '',
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
