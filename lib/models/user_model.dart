import 'dart:convert';

class UserModel {
  final bool isNewUser;
  final String email;
  final bool isEmailVerified;
  final DateTime creationTime;
  final DateTime lastSignInTime;
  final Map<String, dynamic>? profile;
  final String? displayName;
  final String? phoneNumber;
  final String? photoURL;
  final String? providerId;
  final String uid;
  final String refreshToken;

  UserModel({
    required this.isNewUser,
    required this.email,
    required this.isEmailVerified,
    required this.creationTime,
    required this.lastSignInTime,
    required this.profile,
    required this.displayName,
    required this.phoneNumber,
    required this.photoURL,
    required this.providerId,
    required this.uid,
    required this.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      isNewUser: json['isNewUser'] ?? false,
      email: json['email'] ?? '',
      isEmailVerified: json['isEmailVerified'] ?? false,
      creationTime: DateTime.parse(json['creationTime'] ?? ''),
      lastSignInTime: DateTime.parse(json['lastSignInTime'] ?? ''),
      profile: json['profile'],
      displayName: json['displayName'],
      phoneNumber: json['phoneNumber'],
      photoURL: json['photoURL'],
      providerId: json['providerId'],
      uid: json['uid'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isNewUser': isNewUser,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'creationTime': creationTime.toIso8601String(),
      'lastSignInTime': lastSignInTime.toIso8601String(),
      'profile': profile,
      'displayName': displayName,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'providerId': providerId,
      'uid': uid,
      'refreshToken': refreshToken,
    };
  }
}
