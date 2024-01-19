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

class SignOutEvent extends AuthEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class UserLoggedInEvent extends AuthEvent{
  final String uid;

  const UserLoggedInEvent(this.uid);
  @override
  // TODO: implement props
  List<Object?> get props => [uid];

}
