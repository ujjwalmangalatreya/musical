part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();
}
class RegisterUserEvent extends RegistrationEvent{

  final RegistrationModel registrationModel;

  RegisterUserEvent(this.registrationModel);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}