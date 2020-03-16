part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoadingError extends ProfileState {}

class ProfileLoaded extends ProfileState {

  final StockQuote profile;

  ProfileLoaded({
    @required this.profile
  });
}