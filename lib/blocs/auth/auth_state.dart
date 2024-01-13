part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthInProgress extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class AuthSuccessful extends AuthState {
  final User? user;

  const AuthSuccessful({required this.user});

  @override
  List<Object?> get props => [user];

}

class AuthFailed extends AuthState {
  final String failedErrorMessage;

  const AuthFailed({required this.failedErrorMessage});

  @override
  List<Object?> get props => [failedErrorMessage];

}

class SignOutProgress extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignOutComplete extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}