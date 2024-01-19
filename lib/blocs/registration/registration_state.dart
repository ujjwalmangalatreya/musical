part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}

class RegistrationInitial extends RegistrationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegistrationLoading extends RegistrationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegistrationSuccess extends RegistrationState {
  final UserModel userModel;

  const RegistrationSuccess(this.userModel);
  @override
  List<Object?> get props => [userModel];
}

class RegistrationError extends RegistrationState {
  final String error;

  const RegistrationError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}