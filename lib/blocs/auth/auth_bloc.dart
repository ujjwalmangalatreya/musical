import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:musical_mingle/models/user_model.dart';
import 'package:musical_mingle/repositories/auth_repositories.dart';
import 'package:musical_mingle/repositories/user_details_repositories.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();
  UserDetailsRepositories userDetailsRepositories = UserDetailsRepositories();

  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      emit(AuthInProgress());
      try {
        UserCredential? userCredential =
            (await authRepository.registerUser(event.email, event.password));
        UserModel? userModel = await userDetailsRepositories
            .getUserDetails(userCredential.user?.uid);
        emit(AuthSuccessful(userData: userModel));
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

    on<SignInEvent>((event, emit) async {
      emit(AuthInProgress());
      try {
        UserCredential? userCredential =
        (await authRepository.signInUser(event.email, event.password));
        UserModel userModel = await userDetailsRepositories.getUserDetails(userCredential?.user?.uid);
        emit(AuthSuccessful(userData: userModel));
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

    on<UserLoggedInEvent>((event, emit) async {
      emit(AuthInProgress());
      try {
        UserModel userModel = await userDetailsRepositories
            .getUserDetails(event.uid);
        emit(AuthSuccessful(userData: userModel));
      } catch (e) {
        // If an error occurs during sign-out, dispatch AuthFailed state
        emit(AuthFailed(failedErrorMessage: e.toString()));
      }
    });
    


  }
}
