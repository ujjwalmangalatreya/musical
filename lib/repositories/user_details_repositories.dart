

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserDetailsRepositories{
  // Function to get all user data
  Future<UserModel> getUserDetails(userId) async{
    try{
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.
      instance.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        // Convert the data from Firestore to a UserModel instance
        return UserModel(
          id: documentSnapshot['id'],
          email: documentSnapshot['email'],
          displayName: documentSnapshot['displayName'],
          pictureUrl: documentSnapshot['pictureUrl'],
          friends: List<String>.from(documentSnapshot['friends'] ?? []),
        );
      } else {
       // print('Document does not exist');
        return UserModel(id: '', email: '', displayName: '', pictureUrl: '');
      }
    }catch(e){
      rethrow;
    }

  }
}