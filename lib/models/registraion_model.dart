class RegistrationModel {
  final String id;
  final String? email;
  final String? displayName;
  final String? pictureUrl;
  final List<String> friends;

  RegistrationModel({
    required this.id,
    required this.email,
    required this.displayName,
    required this.pictureUrl,
    this.friends = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'displayName': displayName,
      'pictureUrl': pictureUrl,
      'friends': friends,
    };
  }
}