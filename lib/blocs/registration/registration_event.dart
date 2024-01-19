part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}
class RegisterUser extends RegistrationEvent{
  final String email;
  final String password;

  const RegisterUser(this.email,this.password);
  @override
  List<Object?> get props => [email,password];
}