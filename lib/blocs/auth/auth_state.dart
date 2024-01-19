part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class SignInInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class SignInProgress extends AuthState {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class SignInSuccessful extends AuthState {
  final UserModel? userData;

  const SignInSuccessful({required this.userData});

  @override
  List<Object?> get props => [userData];

}

class SignInFailed extends AuthState {
  final String failedErrorMessage;

  const SignInFailed({required this.failedErrorMessage});

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

class UserLoggedInState extends AuthState{
  final UserModel userModel;

  const UserLoggedInState(this.userModel);
  @override
  // TODO: implement props
  List<Object?> get props => [userModel];

}