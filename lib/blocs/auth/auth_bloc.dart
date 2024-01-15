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
            (await authRepository.registerUser(event.email, event.password));
        emit(AuthSuccessful(user:userCredential?.user));
      } catch (e) {
        emit(AuthFailed(failedErrorMessage: e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthInProgress());
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

    on<SignInEvent>((event, emit) async {
      emit(AuthInProgress());
      try {
        UserCredential? userCredential =
        (await authRepository.signInUser(event.email, event.password));
        emit(AuthSuccessful(user: userCredential?.user));
      } catch (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            emit(const AuthFailed(failedErrorMessage: 'User not found'));
          } else if (e.code == 'wrong-password') {
            emit(const AuthFailed(failedErrorMessage: 'Wrong password'));
          } else {
            emit(AuthFailed(failedErrorMessage: 'Sign-in failed: ${e.message}'));
          }
        } else {
          emit(AuthFailed(failedErrorMessage: 'Sign-in failed: ${e.toString()}'));
        }
      }
    });


  }
}
