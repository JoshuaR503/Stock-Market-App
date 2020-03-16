part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoadingError extends ProfileState {}

class ProfileLoaded extends ProfileState {

  final StockQuote quote;
  final CompanyProfile profile;

  ProfileLoaded({
    @required this.quote,
    @required this.profile
  });
}