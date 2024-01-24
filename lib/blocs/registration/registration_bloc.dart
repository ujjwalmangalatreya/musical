import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musical_mingle/models/user_model.dart';
import 'package:musical_mingle/models/user_profile_model.dart';
import 'package:musical_mingle/repositories/user_details_repositories.dart';

import '../../repositories/RegistrationRepository.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial()) {
    on<RegisterUser>((event, emit) async {
      final RegistrationRepository registrationRepository =
          RegistrationRepository();
      final UserDetailsRepositories userDetailsRepositories =
          UserDetailsRepositories();
      emit(RegistrationLoading());
      try {
        UserModel userModel = await registrationRepository.registerUser(
            event.email, event.password);
        UserProfile userProfile = await userDetailsRepositories.addUserProfile();
        emit(RegistrationSuccess(userModel));
      } catch (e) {
        emit(RegistrationError(e.toString()));
      }
    });
  }
}
