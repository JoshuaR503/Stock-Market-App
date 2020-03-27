part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoadingError extends ProfileState {
  final dynamic error;

  ProfileLoadingError({
    @required this.error
  });
}

class ProfileLoaded extends ProfileState {

  final ProfileModel profileModel;
  final bool isMarketOpen;

  ProfileLoaded({
    @required this.profileModel,
    @required this.isMarketOpen
  });
}