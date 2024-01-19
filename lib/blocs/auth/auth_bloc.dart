import 'package:bloc/bloc.dart';
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

  AuthBloc() : super(SignInInitial()) {

    on<SignOutEvent>((event, emit) async {
      emit(SignOutProgress());
      try {
        // Perform the sign-out logic here
        await authRepository.signOut();
        // If sign-out is successful, dispatch AuthSignOutSuccessful state
        emit(SignOutComplete());
      } catch (e) {
        // If an error occurs during sign-out, dispatch AuthFailed state
        emit(SignInFailed(failedErrorMessage: e.toString()));
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(SignInProgress());
      try {
        UserCredential? userCredential =
            (await authRepository.signInUser(event.email, event.password));
        UserModel userModel = await userDetailsRepositories
            .getUserDetails(userCredential?.user?.uid);
        emit(SignInSuccessful(userData: userModel));
      } catch (e) {
        if (e is FirebaseAuthException) {
          if (e.code == 'user-not-found') {
            emit(const SignInFailed(failedErrorMessage: 'User Not Found..'));
          } else if (e.code == 'wrong-password') {
            emit(const SignInFailed(failedErrorMessage: 'Wrong Password.. '));
          } else {
            emit(
                const SignInFailed(failedErrorMessage: 'Something Went Wrong.. '));
          }
        } else {
          emit(SignInFailed(failedErrorMessage: e.toString()));
        }
      }
    });

    // on<UserLoggedInEvent>((event, emit) async {
    //   emit(AuthInProgress());
    //   try {
    //     UserModel userModel =
    //         await userDetailsRepositories.getUserDetails(event.uid);
    //     emit(AuthSuccessful(userData: userModel));
    //   } catch (e) {
    //     // If an error occurs during sign-out, dispatch AuthFailed state
    //     emit(AuthFailed(failedErrorMessage: e.toString()));
    //   }
    // });
  }
}
