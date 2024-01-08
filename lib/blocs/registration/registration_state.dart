part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();
}


class RegistrationInitialState extends RegistrationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegistrationLoadingState extends RegistrationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegistrationSuccessState extends RegistrationState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class RegistrationErrorState extends RegistrationState {
  final String error;

  const RegistrationErrorState(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}