
class RegistrationModel{
  final String email;
  final String password;

  RegistrationModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}