import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:musical_mingle/repositories/user_details_repositories.dart';

import '../../models/user_profile_model.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileLoading()) {
    print("Profile Loading Called");
    on<GetProfile>((event, emit) async {
     // emit (ProfileLoading());
      print("Inside get profile envent");
     try {
       UserDetailsRepositories userDetailsRepositories = UserDetailsRepositories();
       final userProfile = await userDetailsRepositories.getUserProfile();
       print("Profile success as userprofile is fetched.......");
       emit (ProfileSuccess(userProfile));
     }catch(e){
       print("Profile error$e");
       emit (ProfileError(e.toString()));
     }
    });
  }
}
