import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/registraion_model.dart';
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
        RegistrationModel registrationModel = await registrationRepository
            .registerUser(event.email, event.password);
        emit(RegistrationSuccess(registrationModel));
      } catch (e) {
        emit(RegistrationError(e.toString()));
      }
    });
  }
}
