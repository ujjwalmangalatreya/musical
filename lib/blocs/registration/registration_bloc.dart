
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/registraion_model.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitialState());

  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegisterUserEvent) {
      yield RegistrationLoadingState();

      try {
        // Simulate a network call or call your authentication API here
        // For example, you can use FirebaseAuth for user registration
        // Replace this with your actual registration logic
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.registrationModel.email,
          password: event.registrationModel.password,
        );

        // Simulating success for now
        yield RegistrationSuccessState();
      } catch (e) {
        yield RegistrationErrorState('Registration failed: $e');
      }
    }
  }
}
