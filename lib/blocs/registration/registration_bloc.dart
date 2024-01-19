import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/models/user_model.dart';

import '../../repositories/RegistrationRepository.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegisterUser>((event, emit) async {
      final RegistrationRepository registrationRepository =
          RegistrationRepository();
      emit(RegistrationLoading());
      try {
        UserModel userModel = await registrationRepository.registerUser(
            event.email, event.password);
        emit(RegistrationSuccess(userModel));
      } catch (e) {
        emit(RegistrationError(e.toString()));
      }
    });
  }
}
