


import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musical_mingle/repositories/auth_repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();

  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthInProgress());
      try {
        UserCredential? userCredential =
        (await authRepository. registerUser(event.email, event.password));
        User? user = userCredential?.user;

        emit(AuthSuccessful(user: user));
      } catch (e) {
        emit(AuthFailed(failedErrorMessage: e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(SignOutProgress());
      try {
        // Perform the sign-out logic here
        await authRepository.signOut();
        // If sign-out is successful, dispatch AuthSignOutSuccessful state
        emit(SignOutComplete());
      } catch (e) {
        // If an error occurs during sign-out, dispatch AuthFailed state
        emit(AuthFailed(failedErrorMessage: e.toString()));
      }
    });
  }

}
