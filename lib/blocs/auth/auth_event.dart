part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignInEvent(this.email, this.password, {required});
  @override
  // TODO: implement props
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;

  const SignUpEvent(this.email, this.password, this.confirmPassword,
      {required});
  @override
// TODO: implement props
  List<Object?> get props => [email, password, confirmPassword];
}

class SignOutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
