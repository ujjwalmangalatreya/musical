part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileSuccess extends ProfileState {
  final  UserProfile userProfile;

  const ProfileSuccess(this.userProfile);

  @override
  // TODO: implement props
  List<Object?> get props => [userProfile];
}

class ProfileError extends ProfileState {
   final String error;

  const ProfileError(this.error);

  @override
  // TODO: implement props
  List<Object?> get props => [error];
}
