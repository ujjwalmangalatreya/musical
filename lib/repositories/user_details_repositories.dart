import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../models/user_profile_model.dart';

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

  Future<UserProfile> addUserProfile() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    try {
      final userProfile = UserProfile(
        userId: '',
        fullName: "",
        location: "",
        musicalDetails: MusicalDetails(
            instruments: [], genres: [], influences: [], skillLevel: ''),
        bio: "",
        portfolio: Portfolio(soundcloudLink: '', musicSamples: []),
        availabilityPreferences: AvailabilityPreferences(
            rehearsals: false, gigs: false, preferences: ''),
        connectionsCollaborations:
        ConnectionsCollaborations(currentBands: [], collaborations: []),
        socialMediaLinks: SocialMediaLinks(linkedin: '', instagram: ''),
      );
      await FirebaseFirestore.instance
          .collection('userProfiles')
          .doc(userId)
          .set(userProfile.toJson());
      return userProfile;
    }catch(e){
      rethrow;
    }
  }

  Future<UserProfile> getUserProfile() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    try {
      final documentSnapshot = await FirebaseFirestore.instance
          .collection("userProfiles")
          .doc(userId)
          .get();

      if (documentSnapshot.exists) {
        // If the document exists, extract the data
        final userProfileData = documentSnapshot.data() as Map<String, dynamic>;

        // Map the data to the UserProfile model
        final userProfile = UserProfile(
          userId: userProfileData['userId'],
          fullName: userProfileData['fullName'],
          location: userProfileData['location'],
          musicalDetails: MusicalDetails.fromJson(userProfileData['musicalDetails']),
          bio: userProfileData['bio'],
          portfolio: Portfolio.fromJson(userProfileData['portfolio']),
          availabilityPreferences: AvailabilityPreferences.fromJson(userProfileData['availabilityPreferences']),
          connectionsCollaborations: ConnectionsCollaborations.fromJson(userProfileData['connectionsCollaborations']),
          socialMediaLinks: SocialMediaLinks.fromJson(userProfileData['socialMediaLinks']),
        );

        return userProfile;
      } else {
        // Handle the case where the document does not exist
        throw Exception("UserProfile not found for user with ID: $userId");
      }
    } catch (e) {
      // Handle any exceptions that may occur
      rethrow;
    }
  }



// Future<UserProfile> updateUserProfile async {
  //   final userId = FirebaseAuth.instance.currentUser?.uid;
  //
  // }
}
